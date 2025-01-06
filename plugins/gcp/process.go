package main

import (
	"context"
	"fmt"
	"github.com/threatwinds/go-sdk/catcher"
	"github.com/threatwinds/go-sdk/plugins"
	"os"
	"path"

	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials/insecure"
)

func processLogs() {
	conn, err := grpc.NewClient(fmt.Sprintf("unix://%s", path.Join(plugins.GetCfg().Env.Workdir, "sockets", "engine_server.sock")), grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		_ = catcher.Error("failed to connect to engine server", err, map[string]any{})
		os.Exit(1)
	}

	client := plugins.NewEngineClient(conn)

	inputClient, err := client.Input(context.Background())
	if err != nil {
		_ = catcher.Error("failed to create input client", err, map[string]any{})
		os.Exit(1)
	}

	go func() {
		for {
			log := <-logsQueue
			err := inputClient.Send(log)
			if err != nil {
				_ = catcher.Error("failed to send log", err, map[string]any{})
				os.Exit(1)
			}
		}
	}()

	for {
		_, err = inputClient.Recv()
		if err != nil {
			_ = catcher.Error("failed to receive ack", err, map[string]any{})
			os.Exit(1)
		}
	}
}
