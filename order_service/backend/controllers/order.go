package controllers

import (
	"log"
	"net/http"
	"strconv"
	"time"

	"github.com/globalsign/mgo/bson"

	"../helpers"
	"../models"
	"../rabbitmq"
	"github.com/gin-gonic/gin"
)

//CreateNewOrder - Creates a new order
func CreateNewOrder(c *gin.Context) {
	r := new(rabbitmq.RabbitMQ)
	email := new(helpers.Email)

	if err := r.Start(); err != nil {
		c.JSON(500, gin.H{
			"status": "ERROR",
			"msg":    "Problema interno no RabbitMQ",
		})
	}

	if err := email.Start(); err != nil {
		c.JSON(500, gin.H{
			"status": "ERROR",
			"msg":    "Problema interno no gRPC",
		})
	}

	defer r.Close()
	defer email.Close()

	order := &models.Order{}
	if err := c.ShouldBindJSON(order); err != nil {
		log.Println(err)
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    err.Error(),
		})
	} else {
		order.ID = bson.NewObjectId()
		order.Date = time.Now().String()
		order.Status = "PROCESSING"

		// *NÃO É O IDEAL!!!!!!!!!!!!!!*
		if err := order.CreateNewOrder(); err != nil {
			log.Println(err)
			c.JSON(http.StatusInternalServerError, gin.H{
				"status": "ERROR",
				"msg":    "Algo inesperado aconteceu...",
			})
		} else {
			sendOrderToQueues(r, order)

			success, _ := email.SendEmail(
				order.Client.Email,
				"Novo Pedido!",
				order.ID.Hex(),
				"PROCESSING",
			)

			if success {
				c.JSON(http.StatusCreated, gin.H{
					"status": "OK",
					"msg":    "Pedido realizado com sucesso",
				})
			} else {
				c.JSON(http.StatusInternalServerError, gin.H{
					"status": "ERROR",
					"msg":    "Algo inesperado aconteceu...",
				})
			}
		}
	}
}

//ListOrdersByClientID - List Orders By Client ID
func ListOrdersByClientID(c *gin.Context) {
	clientID, err := strconv.Atoi(c.Param("clientId"))
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"status": "ERROR",
			"msg":    "ID inválido!",
		})
	} else {
		if orders, err := models.ListOrdersByClientID(clientID); err != nil {
			log.Println(err)
			c.JSON(http.StatusInternalServerError, gin.H{
				"status": "ERROR",
				"msg":    "Algo inesperado aconteceu...",
			})
		} else {
			if orders == nil {
				orders = []models.Order{}
			}

			c.JSON(http.StatusOK, gin.H{
				"status": "OK",
				"orders": orders,
			})
		}
	}
}

func sendOrderToQueues(r *rabbitmq.RabbitMQ, o *models.Order) {
	rmqs := []models.RMQueue{
		{
			QueueName:  "order-payment",
			RoutingKey: "order.update.payment",
		},
		{
			QueueName:  "order-inventory",
			RoutingKey: "order.update.inventory",
		},
		{
			QueueName:  "order-recommendation",
			RoutingKey: "order.update.recommendation",
		},
	}

	for _, rmq := range rmqs {
		r.Publish(rmq.QueueName, rmq.RoutingKey, o)
	}
}
