package handler

import (
	"context"

	log "go-micro.dev/v4/logger"

	pb "chain/proto"
)

type Chain struct{}

func (e *Chain) CreateChain(ctx context.Context, req *pb.CreateChainRequest, rsp *pb.CreateChainResponse) error {
	log.Infof("Received Chain.CreateChain request: %v", req)

	rsp.Chain = &pb.BikeChain{
		Id:           "urn:bicycle:chain:1",
		CrankId:      req.CrankId,
		Manufacturer: req.Manufacturer,
	}

	return nil
}
