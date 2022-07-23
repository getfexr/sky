package pop

import (
	// "context"
	// "encoding/json"
	// "fmt"
	"bytes"
	"encoding/json"
	"fmt"
	mdl "gofexr/sync-v1/models"
	pb "gofexr/sync-v1/protos/pop"
	"io/ioutil"
	"net/http"

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
	txn string = "http://127.0.0.1:1898/getTxnByCount"
)

func (g *FexrGateway) InitRubixTxn(in *pb.TxnPayload, stream pb.POPService_InitRubixTxnServer) error {
	g.log.Info("Initializing Rubix Txn to DID: ", in.ReceiverDID)

	inputBody := &mdl.InitTxnAPIRequest{
		Receiver:   in.ReceiverDID,
		TokenCount: in.Amount,
		Comment:    in.Comment,
		Type:       1,
	}

	//inputBodyPayload,_ := simplejson.NewJson((inputBody))



	payloadBuf := new(bytes.Buffer)
	//fmt.Printf(" '%s' ", inputBody)
	json.NewEncoder(payloadBuf).Encode(inputBody)
	fmt.Printf("payloadBuf: '%s'", payloadBuf)
	resp, err := http.NewRequest("POST", txn, payloadBuf)
	//TODO: txn params from input
	if err != nil {
		return nil
	}
	body, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return nil
	}

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

func (g *FexrGateway) WalletNotification(in *emptypb.Empty, stream pb.POPService_WalletNotificationServer) error {
	g.log.Info("Sending new Rubix Txn notification")
	// return &pb.PushNotification{
	// 	Notification: pb.PushNotification_PAY,
	// },
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
