package api

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
	"github.com/tidwall/gjson"
	"github.com/utmstack/UTMStack/correlation/cache"
	"github.com/utmstack/UTMStack/correlation/search"
)

// NewLog godoc
// @Summary Insert log
// @Description Insert log to correlation engine
// @Tags queue
// @Accept  json
// @Produce  json
// @Router /newlog [post]
func NewLog(c *gin.Context) {
	start := time.Now()
	var response = map[string]string{}
	body, err := io.ReadAll(c.Request.Body)
	if err != nil {
		response["status"] = "error"
		response["error"] = fmt.Sprintf("%v", err)
		log.Println(response["error"])
		log.Printf("Request took: %s", time.Since(start))
		c.JSON(http.StatusBadRequest, response)
		return
	}

	var lo map[string]interface{}
	if err := json.Unmarshal(body, &lo); err != nil {
		response["status"] = "error"
		response["error"] = fmt.Sprintf("%v", err)
		log.Println(response["error"])
		log.Printf("Request took: %s", time.Since(start))
		c.JSON(http.StatusBadRequest, response)
		return
	}

	lo["id"] = uuid.NewString()

	timestamp, ok := lo["@timestamp"]
	if !ok {
		response["status"] = "error"
		response["error"] = "@timestamp required"
		log.Printf("Request took: %s", time.Since(start))
		c.JSON(http.StatusBadRequest, response)
		return
	}

	if _, err := time.Parse(time.RFC3339Nano, timestamp.(string)); err != nil {
		response["status"] = "error"
		response["error"] = fmt.Sprintf("%v", err)
		log.Printf("Request took: %s", time.Since(start))
		c.JSON(http.StatusBadRequest, response)
		return
	}

	lo["deviceTime"] = timestamp
	lo["@timestamp"] = time.Now().UTC().Format(time.RFC3339Nano)

	lb, _ := json.Marshal(lo)
	l := string(lb)
	if !gjson.Get(l, "dataType").Exists() ||
		!gjson.Get(l, "dataSource").Exists() {
		response["status"] = "error"
		response["error"] = "The log does't have the required fields. Please be sure that you are sending the @timestamp in RFC3339Nano format, the dataType that could be windows, linux, iis, macos, ... and the dataSource that could be the Hostname or IP of the log source."
		log.Printf("%s LOG: %s", response["error"], l)
		log.Printf("Request took: %s", time.Since(start))
		c.JSON(http.StatusBadRequest, response)
		return
	}

	cache.AddToCache(l)
	search.AddToQueue(l)
	response["status"] = "queued"
	log.Printf("Request took: %s", time.Since(start))
	c.JSON(http.StatusOK, response)
}
