package agent

import (
	context "context"
	"net/http"
	"time"

	grpc "google.golang.org/grpc"
	"google.golang.org/grpc/health/grpc_health_v1"
)

func CheckGRPCHealth(conn *grpc.ClientConn) {
	healthClient := grpc_health_v1.NewHealthClient(conn)

	for {
		ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
		resp, err := healthClient.Check(ctx, &grpc_health_v1.HealthCheckRequest{})
		cancel()

		if err != nil {
			time.Sleep(5 * time.Second)
			continue
		}

		if resp.Status == grpc_health_v1.HealthCheckResponse_SERVING {
			return
		}

		time.Sleep(5 * time.Second)
	}
}

func CheckHttpHealth(url string) {
	for {
		resp, err := http.Get(url)
		if err != nil {
			time.Sleep(5 * time.Second)
			continue
		}

		if resp.StatusCode == 200 {
			return
		}

		time.Sleep(5 * time.Second)
	}
}