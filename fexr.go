package main

import (
	"fmt"
	g "gofexr/sync-v1/pop"
	pb "gofexr/sync-v1/protos/pop"
	"log"
	"net"

	l "github.com/EnsurityTechnologies/logger"
	"google.golang.org/grpc"
	// "google.golang.org/grpc/credentials"
	// "gofexr/sync-v1/pop"
)

const (
	ConfigFile string = "config.json"
)

const (
	version     string = "0.6.0"
	gatewayPort string = "0.0.0.0:6942"
)

func ShowVersion() {
	fmt.Printf("\n****************************************\n\n")
	fmt.Printf("gofexr Version : %s\n", version)
	fmt.Printf("Initializing Fexr RPC Gateway..\n")
	fmt.Printf("\n****************************************\n\n")
}

type FexrGateaway struct {
	pb.POPServiceServer
}

func main() {

	ShowVersion()
	lis, err := net.Listen("tcp", gatewayPort)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	// var opts []grpc.DialOption

	// serverCert, err := credentials.NewServerTLSFromFile("../certs/server.crt","../certs/server.key")
	// if err != nil {
	// 	log.Fatalln("failed to create cert", err)
	// }

	// grpcServer := grpc.NewServer(grpc.Creds(serverCert))
	fexrGateaway := grpc.NewServer()

	log := l.New(&l.LoggerOptions{Name: "Fexr Gateway 0.6.0"})

	// rbt := g

	pb.RegisterPOPServiceServer(fexrGateaway, g.NewFexrGateaway(log))

	if err := fexrGateaway.Serve(lis); err != nil {
		log.Error("failed to initialize Fexr RPC Gateway", "err", err)
		return
	}
}
