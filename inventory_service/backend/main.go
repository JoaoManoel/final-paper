package main

import (
	"encoding/json"
	"log"
	"net/http"
	"time"

	"./controllers"
	"./db"
	"./models"
	"./rabbitmq"
	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	time.Sleep(10 * time.Second)

	db.Init()
	rmq := new(rabbitmq.RabbitMQ)

	v1 := r.Group("/api/v1/inventory")
	{
		v1.POST("/", controllers.CreateInventory)
		v1.GET("/all", controllers.ListAllInventory)
		v1.GET("/bySKU/:sku", controllers.FindBySKU)
		v1.PUT("/processing/:sku", controllers.UpdateInventoryProcessing)
		v1.PUT("/canceled/:sku", controllers.UpdateInventoryCanceled)
		v1.PUT("/confirmed/:sku", controllers.UpdateInventoryConfirmed)
		v1.DELETE("/:id", controllers.DeleteInventory)
	}

	r.GET("/health", func(c *gin.Context) {
		db := db.GetDB()

		_, err := db.Exec("SELECT 1+1")

		if err != nil {
			log.Println(err)
			c.String(500, "I'm not healthy :(\n")
		} else {
			c.String(200, "I'm healthy ;)\n")
		}
	})

	r.NoRoute(func(c *gin.Context) {
		c.JSON(http.StatusNotFound, gin.H{
			"status": "ERROR",
			"msg":    "Not Found",
		})
	})

	if err := rmq.Start(); err == nil {
		go func() {
			msgs, err := rmq.Consume()
			if err != nil {
				log.Fatalf("Failed to register a consumer: %s", err)
			}

			forever := make(chan bool)
			for d := range msgs {
				order := models.Order{}
				json.Unmarshal(d.Body, &order)

				log.Printf(" [Info] Status: %s", order.Status)
				for _, p := range order.Products {
					log.Printf(" [Info] Updating Product: %s", p.Model.SKU)
					switch order.Status {
					case "PROCESSING":
						models.UpdateInventoryProcessing(p.Model.SKU, p.Model.Quantity)
					case "PAID":
						models.UpdateInventoryConfirmed(p.Model.SKU, p.Model.Quantity)
					case "CANCELLED":
						models.UpdateInventoryCanceled(p.Model.SKU, p.Model.Quantity)
					}
				}

				rmq.AckMessage(d.DeliveryTag)

			}
			<-forever

		}()
	}

	r.Run(":2334")
}
