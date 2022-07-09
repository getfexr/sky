package pop

import (
	"context"
	syncv1 "gofexr/sync-v1"
	pb "gofexr/sync-v1/protos/pop"

	"github.com/EnsurityTechnologies/logger"
)

type FexrGateway struct {
	pb.POPServiceServer
	log logger.Logger
	rbt *syncv1.Rubix
}

func (g *FexrGateway) ValidatePermission(ctx context.Context, perm *pb.Web3WalletPermission) (*pb.P2PConnectionStatus, error) {
	g.log.Info("I/Fexr: New Lite Wallet Connected. Remembering Connection...")
	return &pb.P2PConnectionStatus{
		Connected: true,
		Code:      200,
	}, nil
}

func (g *FexrGateway) SyncWalletData(perm *pb.Web3WalletPermission, data pb.POPService_SyncWalletDataServer) error {
	g.log.Info("I/Fexr: New Lite Wallet Connected. Syncing wallet data...")
	g.rbt.Sync()
	g.log.Info("I/Fexr: Creating DID, Public and Private Shares if not already exists..")
	g.log.Info("I/Fexr: Moving Private Share to Lite Wallet..")
	g.log.Info("I/Fexr: Finishing Lite Wallet sync..")
	g.log.Info("I/Fexr: Finished Lite Wallet sync")

	return nil
}

func (g *FexrGateway) UpdateWalletKeys(ctx context.Context, keys *pb.RubixWalletData) (*pb.Web3WalletPermission, error) {
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
