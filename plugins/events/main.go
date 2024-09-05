package main

import (
	"context"
	"fmt"
	"net"
	"os"
	"path"

	go_sdk "github.com/threatwinds/go-sdk"
	"github.com/utmstack/UTMStack/plugins/events/search"
	"google.golang.org/grpc"
)

type analysisServer struct {
	go_sdk.UnimplementedAnalysisServer
}

func main() {
	os.Remove(path.Join(
		go_sdk.GetCfg().Env.Workdir,
		"sockets", "com.utmstack.events_analysis.sock"))

	laddr, err := net.ResolveUnixAddr("unix",
		path.Join(go_sdk.GetCfg().Env.Workdir, "sockets",
			"com.utmstack.events_analysis.sock"))

	if err != nil {
		go_sdk.Logger().ErrorF(err.Error())
		os.Exit(1)
	}

	listener, err := net.ListenUnix("unix", laddr)
	if err != nil {
		go_sdk.Logger().ErrorF(err.Error())
		os.Exit(1)
	}

	grpcServer := grpc.NewServer()
	go_sdk.RegisterAnalysisServer(grpcServer, &analysisServer{})

	if err := grpcServer.Serve(listener); err != nil {
		go_sdk.Logger().ErrorF(err.Error())
		os.Exit(1)
	}
}

func (p *analysisServer) Analyze(ctx context.Context,
	event *go_sdk.Event) (*go_sdk.Alert, error) {

	jLog, e := go_sdk.ToString(event)
	if e != nil {
		return nil, fmt.Errorf(e.Message)
	}

	go_sdk.Logger().LogF(100, "received event: %s", *jLog)

	search.AddToQueue(*jLog)

	return nil, nil
}