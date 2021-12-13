package main

import (
	"chain/handler"
	pb "chain/proto"

	"go-micro.dev/v4"
	log "go-micro.dev/v4/logger"
)

var (
	service = "chain"
	version = "latest"
)

func main() {
	// Create service
	srv := micro.NewService(
		micro.Name(service),
		micro.Version(version),
	)
	srv.Init()

	// Register handler
	pb.RegisterChainHandler(srv.Server(), new(handler.Chain))

	// Run service
	if err := srv.Run(); err != nil {
		log.Fatal(err)
	}
}
