package main

import (
	"encoding/json"
	"log"
	"net/http"
	"os"

	"./controllers"
	"./db"
	"./helpers"
	"./models"
	"./rabbitmq"
	"github.com/gin-gonic/gin"
)

type rmQueue struct {
	QueueName, RoutingKey string
}

func failOnError(err error, msg string) {
	if err != nil {
		log.Fatalf("%s: %s", msg, err)
	}
}

func main() {
	port := "2440"
	if _port := os.Getenv("PORT"); _port != "" {
		port = _port
	}

	r := gin.Default()

	v1 := r.Group("/api/v1/order")
	{
		v1.POST("/", controllers.CreateNewOrder)
		v1.GET("/:clientId", controllers.ListOrdersByClientID)
	}

	r.GET("/health", func(c *gin.Context) {
		// checar banco se ta ativo
		if db, err := db.GetDB(); err != nil {
			db.Session.Close()
			c.String(500, "I'm not healthy :(\n")
		} else {
			db.Session.Close()
			c.String(200, "I'm healthy :D\n")
		}

	})

	r.NoRoute(func(c *gin.Context) {
		c.JSON(http.StatusNotFound, gin.H{
			"status": "ERROR",
			"msg":    "Path not found...",
		})
	})

	// aqui vai ficar como Consumidor
	rmq := new(rabbitmq.RabbitMQ)

	if err := rmq.Start(); err == nil {
		go func() {
			msgs, err := rmq.Consume("order-update")
			if err != nil {
				failOnError(err, "Failed to register a consumer")
			}

			forever := make(chan bool)
			for d := range msgs {
				log.Printf("Received a message: %s", d.Body)
				email := new(helpers.Email)

				if err := email.Start(); err == nil {
					defer email.Close()

					order := &models.Order{}
					json.Unmarshal(d.Body, order)
					_newStatus := order.Status

					// complete the order struct
					order.FindOrderByID()

					// Update order Status
					models.UpdateOrderStatus(order.ID, _newStatus)

					order.Status = _newStatus
					sendOrderToQueues(rmq, order)
					email.SendEmail(
						order.Client.Email,
						"Atualizacao do Pedido!",
						order.ID.Hex(),
						_newStatus,
					)

					rmq.AckMessage(d.DeliveryTag)
				}

			}
			<-forever
		}()

		defer rmq.Close()
		r.Run(":" + port)
	}

	panic("RabbitMQ INTERNAL PROBLEM!!!!")
}

func sendOrderToQueues(r *rabbitmq.RabbitMQ, o *models.Order) {
	rmqs := []models.RMQueue{
		{
			QueueName:  "order-inventory",
			RoutingKey: "order.update.inventory",
		},
	}

	for _, rmq := range rmqs {
		r.Publish(rmq.QueueName, rmq.RoutingKey, o)
	}
}
