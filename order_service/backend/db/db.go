package db

import (
	"fmt"
	"os"

	"github.com/globalsign/mgo"
)

//GetDB session
func GetDB() (*mgo.Database, error) {
	conf := checkDbConfig()
	session, err := mgo.Dial(conf["DB_SERVICE"])
	if err != nil {
		fmt.Println("Failed to establish connection to Mongo server:", err)
		return nil, err
	}

	return session.DB(conf["DB_NAME"]), nil
}

func checkDbConfig() map[string]string {
	conf := make(map[string]string)
	dbservice, ok := os.LookupEnv("DB_SERVICE")
	if !ok {
		dbhost, ok := os.LookupEnv("DB_HOST")
		if !ok {
			panic("DB_HOST environment is required! You can use DB_SERVICE")
		}

		dbport, ok := os.LookupEnv("DB_PORT")
		if !ok {
			panic("DB_PORT enviroment is required! You can use DB_SERVICE")
		}

		dbservice = dbhost + ":" + dbport
	}

	dbname, ok := os.LookupEnv("DB_NAME")
	if !ok {
		panic("DB_NAME enviroment is required!")
	}

	conf["DB_SERVICE"] = dbservice
	conf["DB_NAME"] = dbname

	return conf
}
