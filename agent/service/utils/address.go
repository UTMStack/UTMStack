package utils

import (
	"errors"
	"net"
)

func GetIPAddress() (string, error) {
	ipAddress, err := net.InterfaceAddrs()
	if err != nil {
		return "", err
	}

	for _, addr := range ipAddress {
		ipNet, ok := addr.(*net.IPNet)
		if ok && !ipNet.IP.IsLoopback() {
			if ipNet.IP.To4() != nil {
				return ipNet.IP.String(), nil
			}
		}
	}

	return "", errors.New("failed to get IP address")
}
