""" EXEMPLO DO CLIENTE"""
import grpc

# import the generated classes
import email_pb2
import email_pb2_grpc

def run():
  # open a gRPC channel
  channel = grpc.insecure_channel('localhost:50051')
  stub = email_pb2_grpc.EmailSenderStub(channel)

  email = email_pb2.EmailRequest(
    From='joaomanoellins2@gmail.com', 
    to='joaomanoellins@gmail.com', 
    subject='Suaaaa senha', 
    body='<b>Oloco</b>')

  response = stub.sendEmail(email)
  print response

if __name__ == '__main__':
  run()