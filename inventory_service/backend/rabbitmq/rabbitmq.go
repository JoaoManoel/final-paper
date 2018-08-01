package rabbitmq

import (
	"log"
	"os"

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

	log.Println("Closing connection successfully")
	return nil
}

// Consume - Consume from a queue
func (rmq *RabbitMQ) Consume() (msgs <-chan amqp.Delivery, err error) {
	queueName := "order-inventory"
	err = rmq.ch.ExchangeDeclare(
		"order_ex", //exchange
		"topic",    //kind
		true,       //durable
		false,      //autoDelete
		false,      //internal
		false,      //noWait
		nil,        //args
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
		queueName,                //queueName
		"order.update.inventory", //key
		"order_ex",               //exchange
		false,                    //noWait
		nil,                      //args
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
