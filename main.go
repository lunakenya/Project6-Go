package main

import (
	"fmt"
	"net/http"
)

func helloHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "¡Hola, Mundo!")
}

func main() {
	http.HandleFunc("/", helloHandler)
	fmt.Println("Servidor iniciado en http://localhost:8089")
	if err := http.ListenAndServe(":8089", nil); err != nil {
		fmt.Println("Error al iniciar el servidor:", err)
	}
}
