package main

import (
	"fmt"
	"log"
	"net"
	"os"
	g "sky/sync-v1/pop"
	pb "sky/sync-v1/protos/pop"

	l "github.com/EnsurityTechnologies/logger"
	"google.golang.org/grpc"
	// "google.golang.org/grpc/credentials/alts"
	// "google.golang.org/grpc/credentials"
	// "sky/sync-v1/pop"
)

const (
	ConfigFile string = "config.json"
	logFile    string = "FexrLogger.log"
	appName    string = "Fexr sky 0.1.0"
)

const (
	skyPort string = "0.0.0.0:6942"
)

func ShowVersion() {
	fmt.Printf("\n****************************************\n\n")
	fmt.Printf(appName + "\n")
	fmt.Printf("Initializing Fexr RPC sky..\n")
	fmt.Printf("\n****************************************\n\n")
}

type FexrGateaway struct {
	pb.POPServiceServer
}

func main() {

	ShowVersion()
	lis, err := net.Listen("tcp", skyPort)
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

	fp, err := os.OpenFile(logFile, os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0644)

	if err != nil {
		log.Fatalln("error opening file: ", err)
	}

	log := l.New(&l.LoggerOptions{Name: appName, Color: l.AutoColor, Output: fp})

	// rbt := g

	pb.RegisterPOPServiceServer(fexrGateaway, g.NewFexrGateaway(log))

	if err := fexrGateaway.Serve(lis); err != nil {
		log.Error("failed to initialize Fexr RPC sky", "err", err)
		return
	}
}
