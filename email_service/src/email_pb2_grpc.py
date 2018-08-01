# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
import grpc

import email_pb2 as email__pb2


class EmailSenderStub(object):
  # missing associated documentation comment in .proto file
  pass

  def __init__(self, channel):
    """Constructor.

    Args:
      channel: A grpc.Channel.
    """
    self.sendEmail = channel.unary_unary(
        '/EmailSender/sendEmail',
        request_serializer=email__pb2.EmailRequest.SerializeToString,
        response_deserializer=email__pb2.Reply.FromString,
        )


class EmailSenderServicer(object):
  # missing associated documentation comment in .proto file
  pass

  def sendEmail(self, request, context):
    # missing associated documentation comment in .proto file
    pass
    context.set_code(grpc.StatusCode.UNIMPLEMENTED)
    context.set_details('Method not implemented!')
    raise NotImplementedError('Method not implemented!')


def add_EmailSenderServicer_to_server(servicer, server):
  rpc_method_handlers = {
      'sendEmail': grpc.unary_unary_rpc_method_handler(
          servicer.sendEmail,
          request_deserializer=email__pb2.EmailRequest.FromString,
          response_serializer=email__pb2.Reply.SerializeToString,
      ),
  }
  generic_handler = grpc.method_handlers_generic_handler(
      'EmailSender', rpc_method_handlers)
  server.add_generic_rpc_handlers((generic_handler,))
