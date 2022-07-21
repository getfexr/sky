package pop

import (
	"context"
	"encoding/json"
	"fmt"
	mdl "gofexr/sync-v1/models"
	pb "gofexr/sync-v1/protos/pop"
	"io/ioutil"
	"net/http"
	"net/url"
	"os"
	"runtime"

	l "github.com/EnsurityTechnologies/logger"
)

const (
	create string = "http://127.0.0.1:1898/create"
	// initTxn string = "http://127.0.0.1:1898/initiateTransaction"
	sync    string = "http://127.0.0.1:1898/sync"
	account string = "http://127.0.0.1:1898/getAccountInfo"
	// sign    string = "http://127.0.0.1:1898/sign"
	txn    string = "http://127.0.0.1:1898/getTxnByCount"
)

const (
	didImage    string = "../certs/FEXR_DID.png"
	linuxConfig string = "/Rubix/config.json"
	macConfig   string = "/Applications/Rubix/config.json"
	winConfig   string = "C:\\Rubix\\config.json"
)

type FexrGateway struct {
	pb.POPServiceServer
	log l.Logger
	// rbt *syncv1.Rubix
}

func NewFexrGateaway(log l.Logger) *FexrGateway {
	return &FexrGateway{
		log: log,
		// rbt: syncv1.CreateRubix(log),
	}
}

func (g *FexrGateway) ValidatePermission(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.P2PConnectionStatus, error) {
	g.log.Info("New Lite Wallet Connected. Remembering Connection for permission: ", "code ", perm.Code)

	//? if code == 0, then its full permission (including private share)
	//? if code == 6, then its stranger permission (only public share)
	return &pb.P2PConnectionStatus{
		Connected: true,
		Code:      200,
	}, nil
}

func (g *FexrGateway) SyncWalletData(perm *pb.Web3WalletPermission, stream pb.POPService_SyncWalletDataServer) error {

	if perm.Code == 0 {
		g.log.Info("New Lite Wallet Connected. Syncing wallet data...")

		resp, err := http.Get(sync)
		if err != nil {
			return err
		}
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			return err
		}

		sync, err := syncNode([]byte(body))

		// print sync
		fmt.Println(sync.Status)

		if err != nil || sync.Status != "true" {

			g.log.Info("Creating Decentralized IDentity in this node if not already exists..")

			file, err := os.Open(didImage)

			if err != nil {
				return err
			}
			defer file.Close()

			resp, err := http.PostForm(create, url.Values{"data": {"dadad"}, "image": {"dadad"}})

			if err != nil {
				return nil
			}
			body, err := ioutil.ReadAll(resp.Body)
			if err != nil {
				return nil
			}
			_ = body

			if err != nil {
				g.log.Info("Added new DID..")
				return nil
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
			return err
		}

		byteValue, err := ioutil.ReadAll(file)
		defer file.Close()

		if err != nil {
			return err
		}

		var cgfArr mdl.RubixConfig
		err = json.Unmarshal(byteValue, &cgfArr)
		if err != nil {
			return err
		}

		fmt.Printf("%+v\n", cgfArr)

		// Account Info from API

		res, err := http.Get(account)
		if err != nil {
			return err
		}
		accBytes, err := ioutil.ReadAll(res.Body)
		if err != nil {
			return err
		}

		gac, err := getAccount([]byte(accBytes))

		if err != nil {
			return err
		}

		// Transaction Data from API

		// txRes, err := http.Get(txn)
		// if err != nil {
		// 	return err
		// }
		// txBytes, err := ioutil.ReadAll(txRes.Body)
		// if err != nil {
		// 	return err
		// }

		// txList, err := getAccount([]byte(txBytes))
		// _ = txList

		// if err != nil {
		// 	return err
		// }

		// remove the field amount-spent from transaction list
		// for i := 0; i < len(txList.Data.Response); i++ {
		// 	txList.Data.Response[i].AmountSpent = 0
		// }


		return stream.Send(&pb.RubixWalletData{
			DIDHash:      gac.Data.Response.Did,
			PeerID:       "",
			Credits:      &gac.Data.Response.Credits.UnspentCredits,
			TotalTxn:     &gac.Data.Response.TotalTxn,
			StakedTokens: &gac.Data.Response.StakedTokens,
			DIDShare:     new(string),
			PublicShare:  new(string),
			PrivateShare: new(string),
			Balance:      &gac.Data.Response.AvailableBalance,
			TxnHistory:   []*pb.TransactionHistory{},
			QSignedTxns:  []*pb.QuorumSignedTransaction{},
			TChains:      []*pb.TokenChain{},
		})
	}
	g.log.Info("Finished Lite Wallet sync")
	return nil
}

func (g *FexrGateway) UploadWalletKeys(ctx context.Context, keys *pb.RubixWalletData) (*pb.Web3WalletPermission, error) {
	g.log.Info("Updating wallet keys")
	return &pb.Web3WalletPermission{
		DID:    new(string),
		Code:   0,
		Payload: new(string),
	}, nil
}

func (g *FexrGateway) InvalidatePermission(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.P2PConnectionStatus, error) {
	g.log.Info("Invalidating certificate")
	return &pb.P2PConnectionStatus{
		Connected: false,
		Code:      200,
	}, nil
}

func getAccount(body []byte) (*mdl.AccountAPIResponse, error) {
	var s = new(mdl.AccountAPIResponse)
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
