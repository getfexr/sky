package pop

import (
	"github.com/EnsurityTechnologies/logger"
	"gofexr/sync-v1"
	pb "gofexr/sync-v1/protos/pop"
)

type Passport struct {
	log logger.Logger
	rbt *syncv1.Rubix
}

func (pass *Passport) ValidatePermission(perm *pb.Web3WalletPermission) (*pb.P2PConnectionStatus, error) {
	pass.log.Info("I/Fexr: New Lite Wallet Connected. Remembering Connection...")
	return &pb.P2PConnectionStatus{
		Connected: true,
		Code:      200,
	}, nil
}

func (pass *Passport) SyncWalletData(perm *pb.Web3WalletPermission) {
	pass.log.Info("I/Fexr: New Lite Wallet Connected. Syncing wallet data...")
	pass.rbt.Sync()
	pass.log.Info("I/Fexr: Creating DID, Public and Private Shares if not already exists..")
	pass.log.Info("I/Fexr: Moving Private Share to Lite Wallet..")
	pass.log.Info("I/Fexr: Finishing Lite Wallet sync..")
	pass.log.Info("I/Fexr: Finished Lite Wallet sync")
}

func (pass *Passport) UpdateWalletKeys(keys *pb.RubixWalletData) {
	pass.log.Info("Updating wallet keys")
}

func (pass *Passport) InvalidatePermission(perm *pb.Web3WalletPermission) {
	pass.log.Info("Invalidating certificate")
}
