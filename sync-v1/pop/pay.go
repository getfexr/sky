package pop

import (
	pb "gofexr/sync-v1/protos/pop"

	"google.golang.org/protobuf/types/known/emptypb"
)

func (g *FexrGateway) InitRubixTxn(*pb.TxnPayload, pb.POPService_InitRubixTxnServer) error {
	g.log.Info("Initializing Rubix Txn")
	// return &pb.TxnStatus{
	// 	Tid:     "",
	// 	Status:  0,
	// 	Message: new(string),
	// }, nil
	return nil
}

func (g *FexrGateway) WalletNotification(*emptypb.Empty, pb.POPService_WalletNotificationServer) error {
	g.log.Info("Sending new Rubix Txn notification")
	// return &pb.PushNotification{
	// 	Notification: pb.PushNotification_PAY,
	// },
	return nil
}
