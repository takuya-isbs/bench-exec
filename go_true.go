package main

import (
	"fmt"
	"os"
	"os/exec"
)

func main() {
	commandName := "true"
	cmd := exec.Command(commandName)
	cmd.Stdin = os.Stdin
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err := cmd.Run()
	if err != nil {
		if exitError, ok := err.(*exec.ExitError); ok {
			os.Exit(exitError.ExitCode())
		} else {
			fmt.Fprintf(os.Stderr, "Error executing '%s': %v\n", commandName, err)
			os.Exit(1)
		}
	}

	os.Exit(0)
}
