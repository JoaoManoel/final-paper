package models

import (
	"time"

	"../db"
	"github.com/globalsign/mgo/bson"
)

// RMQueue - Struct to define queue and Routing to send a message
type RMQueue struct {
	QueueName, RoutingKey string
}

// Order - Order Struct
type Order struct {
	ID       bson.ObjectId `bson:"_id" json:"order_id"`
	Date     string        `bson:"date" json:"date"`
	Status   string        `bson:"status" json:"status"`
	Amount   float32       `bson:"amount" json:"amount" binding:"required"`
	Products []Product     `bson:"products" json:"products" binding:"dive,required"`
	Client   struct {
		ID              int    `bson:"id" json:"id" binding:"required"`
		Name            string `bson:"name" json:"name" binding:"required"`
		Email           string `bson:"email" json:"email" binding:"required"`
		LastName        string `bson:"last_name" json:"last_name" binding:"required"`
		Birthday        string `bson:"birthday" json:"birthday"`
		LandlineNumber  string `bson:"landline_number" json:"landline_number"`
		CellphoneNumber string `bson:"cellphone_number" json:"cellphone_number"`
		UserID          int    `bson:"user_id" json:"user_id" binding:"required"`
	} `bson:"client" json:"client" binding:"required"`
	Address struct {
		ID              int    `bson:"id" json:"id" binding:"required"`
		AddressName     string `bson:"address_name" json:"address_name" binding:"required"`
		ResponsibleName string `bson:"responsible_name" json:"responsible_name"`
		AddressPhone    string `bson:"address_phone" json:"address_phone"`
		City            string `bson:"city" json:"city" binding:"required"`
		Zipcode         string `bson:"zipcode" json:"zipcode" binding:"required"`
		Address         string `bson:"address" json:"address" binding:"required"`
		State           string `bson:"state" json:"state" binding:"required"`
	} `bson:"address" json:"address" binding:"required"`
	Card struct {
		ID  string `bson:"id" json:"id" binding:"required"`
		Cvc string `bson:"cvc" json:"cvc" binding:"required"`
	} `bson:"card" json:"card" binding:"required"`
}

// Product - Product Struct
type Product struct {
	Name        string  `bson:"name" json:"name" binding:"required"`
	Description string  `bson:"description" json:"description" binding:"required"`
	Detail      string  `bson:"detail" json:"detail"`
	Price       float32 `bson:"price" json:"price" binding:"required"`
	Weight      float32 `bson:"weight" json:"weight"`
	Category    struct {
		ID     int    `bson:"id" json:"id" binding:"required"`
		Name   string `bson:"name" json:"name" binding:"required"`
		Gender string `bson:"gender" json:"gender" binding:"required"`
	} `bson:"category" json:"category" binding:"required"`
	Model struct {
		ID       int    `bson:"id" json:"id" binding:"required"`
		SKU      string `bson:"sku" json:"sku" binding:"required"`
		Quantity int    `bson:"quantity" json:"quantity" binding:"required"`
		Size     string `bson:"size" json:"size" binding:"required"`
		Color    string `bson:"color" json:"color" binding:"required"`
	} `bson:"model" json:"model" binding:"required"`
}

// CreateNewOrder - Creates a new order
func (o Order) CreateNewOrder() error {
	db, err := db.GetDB()
	if err != nil {
		return err
	}

	defer db.Session.Close()

	return db.C("orders").Insert(o)
}

// ListOrdersByClientID - List orders by clientID
func ListOrdersByClientID(id int) ([]Order, error) {
	var orders []Order
	db, err := db.GetDB()
	if err != nil {
		return nil, err
	}

	defer db.Session.Close()

	db.C("orders").Find(bson.M{"client.id": id}).All(&orders)

	return orders, nil
}

// FindOrderByID - Find Order By ID
func (o *Order) FindOrderByID() error {
	db, err := db.GetDB()
	if err != nil {
		return err
	}

	defer db.Session.Close()

	return db.C("orders").FindId(o.ID).One(&o)
}

// UpdateOrderStatus - Update Order Status
func UpdateOrderStatus(id bson.ObjectId, status string) error {
	db, err := db.GetDB()
	if err != nil {
		return err
	}

	defer db.Session.Close()

	return db.C("orders").Update(bson.M{
		"_id": id,
	}, bson.M{
		"$set": bson.M{
			"status": status,
			"date":   time.Now(),
		},
	})
}
