package pop

import (
	"github.com/EnsurityTechnologies/logger"
	pb "gofexr/sync-v1/protos/pop"
)

type Pay struct {
	log logger.Logger
}

func (pay *Pay) InitRubixTxn() {
	pay.log.Info("Initializing Rubix Txn")
}

func (pay *Pay) WalletNotification() (*pb.PushNotification, error) {
	pay.log.Info("Sending new Rubix Txn notification")
	return &pb.PushNotification{
		Notification: pb.PushNotification_PAY,
	}, nil
}