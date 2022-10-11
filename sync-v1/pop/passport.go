package pop

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math/rand"
	"net/http"
	"net/url"
	"os"
	"runtime"
	mdl "sky/sync-v1/models"
	pb "sky/sync-v1/protos/pop"

	l "github.com/EnsurityTechnologies/logger"
)

const (
	create  string = "http://127.0.0.1:1898/create"
	txnData string = "http://127.0.0.1:1898/getTxnByCount"
	sync    string = "http://127.0.0.1:1898/sync"
	account string = "http://127.0.0.1:1898/getAccountInfo"
	// sign    string = "http://127.0.0.1:1898/sign"

)

const (
	didImage    string = "../certs/FEXR_DID.png"
	linuxConfig string = "/Rubix/config.json"
	macConfig   string = "/Applications/Rubix/config.json"
	winConfig   string = "C:\\Rubix\\config.json"
)

type Fexrsky struct {
	pb.SkyServer
	log l.Logger
	// rbt *syncv1.Rubix
}

func NewFexrGateaway(log l.Logger) *Fexrsky {
	return &Fexrsky{
		log: log,
		// rbt: syncv1.CreateRubix(log),
	}
}
func (g *Fexrsky) RequestChallenge(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.P2PChallengeResponse, error) {
	g.log.Info("Incoming challenge request for", "DID ", perm.DID)

	//? if the request is coming from the Fexr app / fexr authenticated app, send a challenge back to the service and check signature response.

	var challenge = generateOTP(*perm.DID)

	return &pb.P2PChallengeResponse{
		Connected: true,
		Challenge: challenge,
	}, nil
}

func (g *Fexrsky) ValidatePermission(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.P2PConnectionStatus, error) {
	g.log.Info("New Lite Wallet Connected. Remembering Connection for permission: ", "code ", perm.Code)

	//? if the request is coming from the Fexr app / fexr authenticated app, send a challenge back to the service and check signature response.
	return &pb.P2PConnectionStatus{
		Connected: true,
		Code:      200,
	}, nil
}

func (g *Fexrsky) SyncWalletData(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.RubixWalletData, error) {

	var accAPI *mdl.AccountAPIResponse
	var txnHistory []*pb.TransactionHistory

	if perm.Code == 0 {
		g.log.Info("New Lite Wallet Connected. Syncing wallet data...")

		resp, err := http.Get(sync)
		if err != nil {
			return nil, err
		}
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			return nil, err
		}

		sync, err := syncNode([]byte(body))

		// print sync
		fmt.Println(sync.Status)

		if err != nil || sync.Status != "true" {

			g.log.Info("Creating Decentralized IDentity in this node if not already exists..")

			file, err := os.Open(didImage)

			if err != nil {
				return nil, err
			}
			defer file.Close()

			resp, err := http.PostForm(create, url.Values{"data": {"dadad"}, "image": {"dadad"}})

			if err != nil {
				return nil, err
			}
			body, err := ioutil.ReadAll(resp.Body)
			if err != nil {
				return nil, err
			}
			_ = body

			if err != nil {
				g.log.Info("Added new DID..")
				return nil, err
			}

		}
		g.log.Info("Finishing Lite Wallet sync with new DID..")

		//TODO: getting file path of config.json

		osType := runtime.GOOS
		g.log.Info("OS Type: ", osType)
		var homeDir = os.Getenv("HOME")
		var rubixCfg = ""

		if osType == "windows" {
			rubixCfg = homeDir + winConfig
		} else if osType == "linux" {
			rubixCfg = homeDir + linuxConfig
		} else if osType == "darwin" {
			rubixCfg = macConfig
		}

		g.log.Info("Rubix config file path: ", "path ", rubixCfg)

		file, err := os.Open(rubixCfg)
		if err != nil {
			return nil, err
		}

		byteValue, err := ioutil.ReadAll(file)
		defer file.Close()

		if err != nil {
			return nil, err
		}

		var cgfArr mdl.RubixConfig
		err = json.Unmarshal(byteValue, &cgfArr)
		if err != nil {
			return nil, err
		}

		fmt.Printf("%+v\n", cgfArr)

		// Account Info from API

		res, err := http.Get(account)
		if err != nil {
			return nil, err
		}
		accBytes, err := ioutil.ReadAll(res.Body)
		if err != nil {
			return nil, err
		}

		gac, err := getAccount([]byte(accBytes))

		accAPI = gac

		if err != nil {
			return nil, err
		}

		postBody, _ := json.Marshal(map[string]string{
			"txnCount": "38",
		})
		responseBody := bytes.NewBuffer(postBody)

		txRes, err := http.Post(txnData, "application/json", responseBody)
		if err != nil {
			return nil, err
		}

		txBytes, err := ioutil.ReadAll(txRes.Body)
		if err != nil {
			return nil, err
		}

		txList, err := TxnHistoryData([]byte(txBytes))
		_ = txList

		if err != nil {
			return nil, err
		}

		fmt.Println(txList)

		// format txList to be used in pb.TransactionHistory

		for _, tx := range txList.Data.Response {
			var txnHist pb.TransactionHistory
			txnHist.Txn = tx.Txn
			txnHist.SenderDID = tx.SenderDID
			txnHist.ReceiverDID = tx.ReceiverDID
			txnHist.Amount = fmt.Sprintf("%f", tx.Amount)
			txnHist.Date = tx.Date
			txnHist.Role = tx.Role
			txnHist.TotalTime = 0
			txnHist.Comment = tx.Comment
			txnHist.StatusCode = "Success"
			txnHistory = append(txnHistory, &txnHist)
		}

		// reverse the order of the txnHistory
		for i, j := 0, len(txnHistory)-1; i < j; i, j = i+1, j-1 {
			txnHistory[i], txnHistory[j] = txnHistory[j], txnHistory[i]
		}

		// var txHistory []*pb.TransactionHistory
		// for tx := range txList.Transactions {
		// 	txHistory = append(txHistory, &pb.TransactionHistory{
		// 		Txn:         tx.,
		// 		SenderDID:   "",
		// 		ReceiverDID: "",
		// 		Amount:      "",
		// 		Date:        "",
		// 		Role:        "",
		// 		TotalTime:   0,
		// 		Comment:     "",
		// 		StatusCode:  "",
		// 		QuorumList:  new(string),
		// 	})
		// }
	}
	g.log.Info("Finished Lite Wallet sync")

	return &pb.RubixWalletData{
		DIDHash:      &accAPI.Data.Response.Did,
		PeerID:       new(string),
		Credits:      new(int32),
		TotalTxn:     new(int32),
		StakedTokens: new(int32),
		DIDShare:     new(string),
		PublicShare:  new(string),
		PrivateShare: new(string),
		Balance:      &accAPI.Data.Response.AvailableBalance,
		TxnHistory:   txnHistory,
		QSignedTxns:  []*pb.QuorumSignedTransaction{},
		TChains:      []*pb.TokenChain{},
	}, nil
}

func (g *Fexrsky) UploadWalletKeys(ctx context.Context, keys *pb.RubixWalletData) (*pb.Web3WalletPermission, error) {
	g.log.Info("Updating wallet keys")
	return &pb.Web3WalletPermission{
		DID:     new(string),
		Code:    0,
		Payload: new(string),
	}, nil
}

func (g *Fexrsky) InvalidatePermission(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.P2PConnectionStatus, error) {
	g.log.Info("Invalidating certificate")
	return &pb.P2PConnectionStatus{
		Connected: false,
		Code:      200,
	}, nil
}

// generate a 4 digit one time code every time this function runs
// format for OTP is not defined by fexr. It is defined and validated by third party users
// we do not validate the OTP format,
// but we do reccommend that it be of the format one-time nonce for <did> in <platform-code> is <OTP>
func generateOTP(did string) string {
	var message = "one-time nonce for "
	message = message + did + " in fexr-sky is "

	var digits = "0123456789"
	var otp = ""
	for i := 0; i < 4; i++ {
		otp = otp + string(digits[rand.Intn(len(digits))])
	}
	otp = message + otp
	return otp
}

func getAccount(body []byte) (*mdl.AccountAPIResponse, error) {
	var s = new(mdl.AccountAPIResponse)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}

func TxnHistoryData(body []byte) (*mdl.TxHistoryAPIResponse, error) {
	var s = new(mdl.TxHistoryAPIResponse)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}

func syncNode(body []byte) (*mdl.SyncAPIResponse, error) {
	var s = new(mdl.SyncAPIResponse)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}

func createAccount(body []byte) (*mdl.CreateAPIResponse, error) {
	var s = new(mdl.CreateAPIResponse)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}

func getRubixConfig(body []byte) (*mdl.RubixConfig, error) {
	var s = new(mdl.RubixConfig)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}

func apiConnect() {
	
	resp, err := http.Get("http://localhost:1898/exportShares")

    if err != nil {
        fmt.Print(err.Error())
        os.Exit(1)
    }
	defer resp.Body.Close()

    body, err := ioutil.ReadAll(resp.Body)

    if err != nil {
		fmt.Print(err.Error())
        os.Exit(1)
    }

    fmt.Println(string(body))

    // var res map[string]interface{}

    // json.NewDecoder(resp.Body).Decode(&res)

    // fmt.Println(res["json"])
}
