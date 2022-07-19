package pop

import (
	"context"
	"encoding/json"
	"fmt"
	l "github.com/EnsurityTechnologies/logger"
	mod "gofexr/sync-v1/models"
	pb "gofexr/sync-v1/protos/pop"
	"io/ioutil"
	"net/http"
)

const (
	create string = "localhost:1898/create"
	// initTxn string = "localhost:1898/initiateTransaction"
	sync    string = "localhost:1898/sync"
	account string = "localhost:1898/getAccountInfo"
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

		resp, err := http.Get(account)
		if err != nil {
			return err
		}
		body, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			return err
		}

		gac, err := getAccount([]byte(body))
		fmt.Printf("%+v\n", gac)
		_ = gac

		if err != nil || gac.Data.Response.Did == "" {

			g.log.Info("Creating Decentralized IDentity in this node if not already exists..")
			resp, err := http.PostForm(create, url.Values{"did": {"did:ethr:0x" + keys.Did}})

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

				return stream.Send(&pb.RubixWalletData{
					DIDShare:     new(string),
					PublicShare:  new(string),
					PrivateShare: new(string),
					Balance:      new(float64),
					Th:           []*pb.TransactionHistory{},
					Qst:          []*pb.QuorumSignedTransaction{},
					Tc:           []*pb.TokenChain{},
				})

				g.log.Info("Finishing Lite Wallet sync..")
				g.log.Info("Finished Lite Wallet sync")
				return nil
			}

		} else {
			return nil
		}
	}
	return nil
}

func (g *FexrGateway) UploadWalletKeys(ctx context.Context, keys *pb.RubixWalletData) (*pb.Web3WalletPermission, error) {
	g.log.Info("Updating wallet keys")
	return &pb.Web3WalletPermission{
		DID:    new(string),
		Code:   0,
		PeerID: new(string),
	}, nil
}

func (g *FexrGateway) InvalidatePermission(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.P2PConnectionStatus, error) {
	g.log.Info("Invalidating certificate")
	return &pb.P2PConnectionStatus{
		Connected: false,
		Code:      200,
	}, nil
}

func getAccount(body []byte) (*mod.AccountAPIResponse, error) {
	var s = new(mod.AccountAPIResponse)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}

func createAccount(body []byte) (*mod.CreateAPIResponse, error) {
	var s = new(mod.CreateAPIResponse)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}
