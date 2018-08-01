from concurrent import futures
import time
import email_sender

import grpc
import email_pb2
import email_pb2_grpc

_ONE_DAY_IN_SECONDS = 60 * 60 * 24

class EmailSender(email_pb2_grpc.EmailSenderServicer):
  def sendEmail(self, request, context):
    response = email_pb2.Reply()
    response.success = email_sender.sendmail(request.From, request.to, request.subject, request.body)
    print(response)
    
    return response

def serve():
  server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))
  email_pb2_grpc.add_EmailSenderServicer_to_server(EmailSender(), server)

  print('Starting server. Listening on port 50051.')
  server.add_insecure_port('[::]:50051')
  server.start()
  try:
    while True:
      time.sleep(_ONE_DAY_IN_SECONDS)
  except KeyboardInterrupt:
    server.stop(0)

if __name__ == '__main__':
  serve()

