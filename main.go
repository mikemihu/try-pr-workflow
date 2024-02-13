package main

import (
	"fmt"
	"log"
	"os"

	"github.com/mikemihu/try-private-module/helper"
)

func main() {
	fmt.Println("Waaaw")

	fmt.Println(helper.Yell())

	readEnvFile()
}

func readEnvFile() {
	body, err := os.ReadFile(".env")
	if err != nil {
		log.Fatalf("unable to read file: %v", err)
	}

	fmt.Printf(".env:\n%s\n\n", body)
}
