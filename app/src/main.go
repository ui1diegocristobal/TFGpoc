package main

import (
	"log"
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("./code"))
	http.Handle("/", fs)

	log.Print("Listening...")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal(err)
	}
}
