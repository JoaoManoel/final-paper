package db

import (
	"fmt"
	"os"

	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq" //import postgresql, don't remove
)

var db *sqlx.DB

/*Init - Read the os environment and connect to database */
func Init() {
	config := checkDbConfig()
	psqlInfo := fmt.Sprintf("postgres://%s:%s@%s/%s?sslmode=disable",
		config["DB_USER"], config["DB_PASS"],
		config["DB_SERVICE"], config["DB_NAME"])

	db = sqlx.MustConnect("postgres", psqlInfo)

	fmt.Println("Database successfully connected!")
}

//GetDB ...
func GetDB() *sqlx.DB {
	return db
}

func checkDbConfig() map[string]string {
	conf := make(map[string]string)

	dbservice, ok := os.LookupEnv("DB_SERVICE")
	if !ok {
		dbhost, ok := os.LookupEnv("DB_HOST")
		if !ok {
			panic("DB_HOST environment is required!")
		}

		dbport, ok := os.LookupEnv("DB_PORT")
		if !ok {
			panic("DB_PORT environment is required!")
		}

		dbservice = dbhost + ":" + dbport
	}

	dbuser, ok := os.LookupEnv("DB_USER")
	if !ok {
		panic("DB_USER environment is required!")
	}

	dbpass, ok := os.LookupEnv("DB_PASS")
	if !ok {
		panic("DB_PASS environment is required!")
	}

	dbname, ok := os.LookupEnv("DB_NAME")
	if !ok {
		panic("DB_NAME environment is required!")
	}

	conf["DB_SERVICE"] = dbservice
	conf["DB_USER"] = dbuser
	conf["DB_PASS"] = dbpass
	conf["DB_NAME"] = dbname

	return conf
}
