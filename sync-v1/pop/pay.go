package pop

import (
	// "context"
	// "encoding/json"
	// "fmt"
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	mdl "sky/sync-v1/models"
	pb "sky/sync-v1/protos/pop"

	// "io/ioutil"
	// "net/http"
	// "net/url"
	// "os"
	// "runtime"
	// "time"

	// l "github.com/EnsurityTechnologies/logger"
	"google.golang.org/protobuf/types/known/emptypb"
)

const (
	txn string = "http://127.0.0.1:1898/initiateTransaction"
)

func (g *Fexrsky) HelloHello(ctx context.Context, perm *emptypb.Empty) (*pb.HelloResponse, error) {
	g.log.Info("Getting hellow world")
	return &pb.HelloResponse{Message: "Hello from Sky"}, nil
}

func (g *Fexrsky) InitRubixTxn(in *pb.TxnPayload, stream pb.Sky_RbtPayServer) error {
	g.log.Info("Initializing Rubix Transaction from lite wallet ", "metadata", in)

	inputBody := &mdl.InitTxnAPIRequest{
		Receiver:   in.ReceiverDID,
		TokenCount: in.Amount,
		Comment:    in.Comment,
		Type:       1,
	}

	// if quorumList in TxnPayload is not empty, then we need to change Type as 3
	if len(in.QuorumList) == 21 {
		inputBody.Type = 3
		// inputBody.QuorumList = in.QuorumList
	}

	payloadBuf := new(bytes.Buffer)
	//fmt.Printf(" '%s' ", inputBody)
	json.NewEncoder(payloadBuf).Encode(inputBody)
	fmt.Println("payloadBuf: ", string(payloadBuf.String()))
	client := &http.Client{}
	req, err := http.NewRequest("POST", txn, payloadBuf)

	//TODO: txn params from input
	if err != nil {
		fmt.Printf("error in -type")
		return nil
	}
	req.Header.Add("Content-Type", "application/json")
	res, err := client.Do(req)
	if err != nil {
		fmt.Printf("error in content-type")
		return nil
	}
	defer res.Body.Close()
	body, err := ioutil.ReadAll(req.Body)
	if err != nil {
		fmt.Printf("error in body")

		return nil
	}
	//fmt.Println(string(body))

	//TODO: check if txn is running in another thread and response is going on while the API is running.
	txnStatus, err := initTxn([]byte(body))

	if err != nil {

		s := err.Error()

		return stream.Send(&pb.TxnStatus{
			Tid:     "",
			Status:  pb.TxnStatus_CANCELED,
			Message: &s,
		})

	} else {
		if txnStatus.Status == "success" {

			return stream.Send(&pb.TxnStatus{
				Tid:     txnStatus.Data.Response.Tid,
				Status:  pb.TxnStatus_SUCCESS,
				Message: &txnStatus.Message,
			})

		} else {

			return stream.Send(&pb.TxnStatus{
				Tid:     "",
				Status:  pb.TxnStatus_FAILED,
				Message: &txnStatus.Message,
			})
		}
	}

	// for i := 0; i < 45; i++ {
	// 	time.Sleep(time.Minute)

	// 	//TODO: check if response is there yet. it will take more time, till then show VALIDATING reponse.
	// 	if txnStatus.Status == "" {

	// 		break

	// 	} else if txnStatus.Status == "success" {
	// return stream.Send(&pb.TxnStatus{
	// 	Tid:     "",
	// 	Status:  pb.TxnStatus_SUCCESS,
	// 	Message: new(string),
	// })
	// 	} else {
	// 		return stream.Send(&pb.TxnStatus{
	// 			Tid:     "",
	// 			Status:  pb.TxnStatus_VALIDATING,
	// 			Message: new(string),
	// 		})
	// 	}
	// }
	return nil
}

func (g *Fexrsky) WalletNotification(in *emptypb.Empty, stream pb.Sky_NotificationServer) error {
	g.log.Info("Sending new Rubix Txn notification")
	// send notification to lite wallet every 1 min
	if false {
		var notificationMsg = "Your wallet is safe with Fexr"

		return stream.Send(&pb.P2PNotification{
			Notification: pb.P2PNotification_REMINDER,
			Message:      &notificationMsg,
			Txn:          &pb.TransactionHistory{},
		})
	}
	return nil
}

func initTxn(body []byte) (*mdl.InitTxnAPIResponse, error) {
	var s = new(mdl.InitTxnAPIResponse)
	err := json.Unmarshal(body, &s)
	if err != nil {
		fmt.Println("whoops:", err)
	}
	return s, err
}
