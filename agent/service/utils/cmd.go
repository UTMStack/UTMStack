package utils

import (
	"errors"
	"os/exec"
	"strings"

	"github.com/threatwinds/validations"
)

func ExecuteWithResult(c string, dir string, arg ...string) (string, bool) {
	cmd := exec.Command(c, arg...)

	cmd.Dir = dir
	if errors.Is(cmd.Err, exec.ErrDot) {
		cmd.Err = nil
	}

	out, err := cmd.Output()
	if err != nil {
		return string(out) + err.Error(), true
	}

	cleanedOut := strings.TrimSpace(string(out))

	if cleanedOut == "" {
		return "command executed successfully", false
	}

	validUtf8Out, _, err := validations.ValidateString(cleanedOut, false)
	if err != nil {
		return string(out) + err.Error(), true
	}

	return validUtf8Out, false
}

func Execute(c string, dir string, arg ...string) error {
	cmd := exec.Command(c, arg...)
	cmd.Dir = dir

	return cmd.Run()
}
