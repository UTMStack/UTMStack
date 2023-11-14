package updates

import (
	"fmt"
	"net/http"
	"strconv"
	"strings"

	"github.com/utmstack/UTMStack/agent/updater/constants"
	"github.com/utmstack/UTMStack/agent/updater/utils"
)

func getMasterVersion(ip string) (string, error) {
	resp, status, err := utils.DoReq[InfoResponse]("https://"+ip+constants.MASTERVERSIONENDPOINT, nil, http.MethodGet, map[string]string{})
	if err != nil {
		return "", err
	} else if status != http.StatusOK {
		return "", fmt.Errorf("status code %d: %v", status, resp)
	}
	return resp.Build.Version, nil
}

func isVersionGreater(oldVersion, newVersion string) bool {
	oldParts := strings.Split(oldVersion, ".")
	newParts := strings.Split(newVersion, ".")

	for i, oldPart := range oldParts {
		nOld, _ := strconv.Atoi(oldPart)
		if i < len(newParts) {
			nNew, _ := strconv.Atoi(newParts[i])
			if nNew > nOld {
				return true
			} else if nNew < nOld {
				return false
			}
		}
	}
	return false
}

func isNewOrEqualVersion(oldVersion, newVersion string) bool {
	oldParts := strings.Split(oldVersion, ".")
	newParts := strings.Split(newVersion, ".")

	minLength := len(oldParts)
	if len(newParts) < minLength {
		minLength = len(newParts)
	}

	for i := 0; i < minLength; i++ {
		nOld, _ := strconv.Atoi(oldParts[i])
		nNew, _ := strconv.Atoi(newParts[i])

		if nNew > nOld {
			return true
		} else if nNew < nOld {
			return false
		}
	}

	return len(newParts) >= len(oldParts)
}
