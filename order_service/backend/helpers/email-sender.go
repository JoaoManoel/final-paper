package helpers

import (
	"fmt"
	"log"
	"os"
	"time"

	pb "../protos"
	"golang.org/x/net/context"
	"google.golang.org/grpc"
)

func failOnError(err error, msg string) {
	log.Fatalf("%s: %s", msg, err)
}

// Email - Email Struct
type Email struct {
	conn *grpc.ClientConn
}

// Start - Starts gRPC client
func (e *Email) Start() (err error) {
	address, ok := os.LookupEnv("EMAIL_SERVICE")
	if !ok {
		panic("EMAIL_SERVICE environment is required!")
	}

	e.conn, err = grpc.Dial(address, grpc.WithInsecure())
	if err != nil {
		failOnError(err, "Failed to Connect to gRPC")
		return err
	}
	return nil
}

// Close - Closes the gRPC connection
func (e *Email) Close() (err error) {
	err = e.conn.Close()

	if err != nil {
		failOnError(err, "Failed to close the gRPC connection")
		return err
	}

	return nil
}

// SendEmail - Send email to gRPC server
func (e *Email) SendEmail(to string, subject string, orderID string, orderStatus string) (success bool, err error) {
	sendEmail, ok := os.LookupEnv("SEND_EMAIL")
	if !ok || sendEmail == "false" {
		return true, nil
	}

	c := pb.NewEmailSenderClient(e.conn)
	ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
	defer cancel()

	var body string
	switch orderStatus {
	case "PROCESSING":
		body = fmt.Sprintf("Ola,<br/><br/>Recebemos seu novo pedido: %s <br/><br/>Status eh PROCESSANDO", orderID)
	case "PAID":
		body = fmt.Sprintf("Ola,<br/><br/>Seu novo pedido numero: %s foi atualizado.<br/><br/>O status agora eh PAGO", orderID)
	case "CANCELLED":
		body = fmt.Sprintf("Ola,<br/><br/>Seu novo pedido numero: %s foi atualizado.<br/><br/>O status agora eh CANCELADO.<br/><br/>Por favor, entre em contato com o central de atendimento.", orderID)
	}

	r, err := c.SendEmail(ctx, &pb.EmailRequest{
		From:    "joaomanoellins2@gmail.com",
		To:      to,
		Subject: subject,
		Body:    body,
	})

	if err != nil {
		failOnError(err, "Failed to send email")
		return false, err
	}

	return r.Success, err
}
