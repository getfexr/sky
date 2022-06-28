package main

import (
	"log"
	"net"
	"fmt"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
	// "gofexr/sync-v1/pop"
)

const (
	ConfigFile string = "config.json"
)

const (
	version string = "0.6.0"
)

func ShowVersion() {
	fmt.Printf("\n****************************************\n\n")
	fmt.Printf("gofexr Version : %s\n", version)
	fmt.Printf("\n****************************************\n\n")
}

func main() {

	lis, err := net.Listen("tcp", ":6942")
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}

	serverCert, err := credentials.NewServerTLSFromFile("../certs/server.crt","../certs/server.key")
	if err != nil {
		log.Fatalln("failed to create cert", err)
	}

	grpcServer := grpc.NewServer(grpc.Creds(serverCert))

	// passport.

	if err := grpcServer.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %s", err)
	}
}
