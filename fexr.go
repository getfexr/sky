package main

import (
	"log"
	"net"
	"fmt"
	"google.golang.org/grpc"

	pb "gofexr/sync-v1/protos/pop"

	// "google.golang.org/grpc/credentials"
	// "gofexr/sync-v1/pop"
)

const (
	ConfigFile string = "config.json"
)

const (
	version string = "0.6.0"
	gatewayPort string = ":6942"
)

func ShowVersion() {
	fmt.Printf("\n****************************************\n\n")
	fmt.Printf("gofexr Version : %s\n", version)
	fmt.Printf("Initializing Fexr RPC Gateway..\n")
	fmt.Printf("\n****************************************\n\n")
}

// type fexrGateaway struct {
// 	pb
// }

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

	pb.RegisterFexrGateway(fexrGateaway, &FexrGateway{})

	if err := fexrGateaway.Serve(lis); err != nil {
		log.Fatalf("failed to initialize Fexr RPC Gateway: %s", err)
	}
}
