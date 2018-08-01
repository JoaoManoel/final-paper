package rabbitmq

import (
	"encoding/json"
	"log"
	"os"

	"../models"
	"github.com/streadway/amqp"
)

// RabbitMQ - rabbitMQ struct
type RabbitMQ struct {
	conn *amqp.Connection
	ch   *amqp.Channel
}

func failOnError(err error, msg string) {
	log.Fatalf("%s: %s", msg, err)
}

// Start - Start RabbitMQ Connection and Channel
func (rmq *RabbitMQ) Start() (err error) {
	rabbitmqHost, ok := os.LookupEnv("RABBITMQ_SERVICE")
	var rabbitmqUser string
	var rabbitmqPass string

	if !ok {
		panic("RABBITMQ_SERVICE environment is required!")
	} else {
		rabbitmqUser, ok = os.LookupEnv("RABBITMQ_USER")

		if !ok {
			panic("RABBITMQ_USER environment is required!")
		} else {
			rabbitmqPass, ok = os.LookupEnv("RABBITMQ_PASS")
		}
	}

	rmq.conn, err = amqp.Dial("amqp://" + rabbitmqUser + ":" + rabbitmqPass + "@" + rabbitmqHost)
	if err != nil {
		failOnError(err, "Failed to connect to RabbitMQ")
		return err
	}

	rmq.ch, err = rmq.conn.Channel()

	if err != nil {
		failOnError(err, "Failed to open a channel")
		return err
	}

	log.Println("Started the connection successfully")
	return nil
}

// Close - Closes the RabbitMQ connection
func (rmq *RabbitMQ) Close() (err error) {
	err = rmq.conn.Close()
	if err != nil {
		failOnError(err, "Failed to close the connection")
		return err
	}

	log.Println("Closing RabbitMQ connection successfully")
	return nil
}

// Publish - Publishes to a exchange
func (rmq *RabbitMQ) Publish(queueName string, routingKey string, o *models.Order) (err error) {
	err = rmq.ch.ExchangeDeclare(
		"order_ex", // exchange
		"topic",    //kind
		true,
		false,
		false,
		false,
		nil,
	)

	if err != nil {
		failOnError(err, "Failed to declare a exchange")
		return err
	}

	_, err = rmq.ch.QueueDeclare(
		queueName, //queueName
		true,      // durable
		false,     //autodelete
		false,     //exclusive
		false,     //nowait
		nil,       //args
	)

	if err != nil {
		failOnError(err, "Failed to declare a queue")
		return err
	}

	err = rmq.ch.QueueBind(
		queueName,
		routingKey,
		"order_ex",
		false,
		nil,
	)

	if err != nil {
		failOnError(err, "Failed to bind a queue")
	}

	out, _ := json.Marshal(o)
	log.Printf("Sending New Order: %s To %s Queue", o.ID.Hex(), queueName)

	err = rmq.ch.Publish(
		"order_ex", //exchange
		routingKey, //key
		false,
		false,
		amqp.Publishing{
			DeliveryMode: amqp.Persistent,
			ContentType:  "text/plain",
			Body:         out,
		},
	)

	if err != nil {
		failOnError(err, "Failed to publish a message")
		return err
	}

	return nil
}

// Consume - Consume from a queue
func (rmq *RabbitMQ) Consume(queueName string) (msgs <-chan amqp.Delivery, err error) {
	err = rmq.ch.ExchangeDeclare(
		"order-update_ex", //exchange
		"topic",           //kind
		true,              //durable
		false,             //autoDelete
		false,             //internal
		false,             //noWait
		nil,               //args
	)

	if err != nil {
		failOnError(err, "Failed to declare a exchange")
		return nil, err
	}

	q, err := rmq.ch.QueueDeclare(
		queueName, //queueName
		true,      // durable
		false,     //autodelete
		false,     //exclusive
		false,     //nowait
		nil,       //args
	)

	if err != nil {
		failOnError(err, "Failed to declare a queue")
		return nil, err
	}

	rmq.ch.QueueBind(
		queueName,         //queueName
		"order.update",    //key
		"order-update_ex", //exchange
		false,             //noWait
		nil,               //args
	)

	msgs, err = rmq.ch.Consume(
		q.Name, // queue
		"",     // consumer
		false,  // auto-ack
		false,  // exclusive
		false,  // no-local
		false,  // no-wait
		nil,    // args
	)

	log.Println("Started to consume...")

	return msgs, err
}

// AckMessage - Ack the message
func (rmq *RabbitMQ) AckMessage(tag uint64) (err error) {
	err = rmq.ch.Ack(tag, false)
	return err
}
