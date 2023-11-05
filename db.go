package main

import (
	"context"
	"fmt"
	"log"
	"os"

	"github.com/jackc/pgx/v4/pgxpool"
	"github.com/joho/godotenv"
)

func initializeDB() *pgxpool.Pool {

	if err := godotenv.Load(); err != nil {
		log.Fatalf("Error loading .env file: %v", err)
	}

	// Initialize the database connection pool
	connString := os.Getenv("DB_URL")
	pool, err := pgxpool.Connect(context.Background(), connString)
	if err != nil {
		fmt.Println(err)
		return pool
	}
	return pool
}
