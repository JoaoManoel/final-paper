import json
import pika
import os
import sys
import traceback
from src.payment import controllers

def connect(rabbitmq_host=None):
  is_connect = False
  if rabbitmq_host is None:
    rabbitmq_host = os.getenv('RABBITMQ_SERVICE', 'localhost')
    rabbitmq_user = os.getenv('RABBITMQ_USER', 'guest')
    rabbitmq_pass = os.getenv('RABBITMQ_PASS', 'guest')
  
  while is_connect is False:
    try:
      credentials = pika.PlainCredentials(rabbitmq_user, rabbitmq_pass)
      connection = pika.BlockingConnection(pika.ConnectionParameters(host=rabbitmq_host, credentials=credentials))
      is_connect = True
      return connection.channel()
    except pika.exceptions.AMQPConnectionError:
      print(traceback.format_exc())

def callback(ch, method, properties, body):
  tag = method.delivery_tag

  order = json.loads(body)
  _payment = {
    'payment_id': order['card']['id'],
    'client_id': order['client']['id'],
    'order_id': order['order_id'],
    'amount': order['amount'],
    'cvc': order['card']['cvc'],
  }

  print("Processing payment ID:", order['order_id'])
  controllers.check_creditcard_and_pay(_payment, is_rabbitmq=True, channel=ch, delivery_tag=tag)

def produce(queue_name, order_update):
  print("Sending message:", order_update)

  channel = connect()
  channel.exchange_declare(
    exchange='order-update_ex',
    exchange_type='topic',
    durable=True
  )

  channel.queue_declare(
    queue=queue_name,
    durable=True
  )

  channel.queue_bind(
    queue=queue_name,
    exchange="order-update_ex",
    routing_key="order.update"
  )
  
  channel.basic_publish(
    exchange='order-update_ex',
    routing_key="order.update",
    body=json.dumps(order_update),
    properties=pika.BasicProperties(
      content_type='text/plain',
      delivery_mode=2 # make message persistent
    )
  )

def consume(channel):
  exchange_name = "order_ex"
  queue_name = "order-payment"
  routing_key = "order.update.payment"

  channel.exchange_declare(
    exchange=exchange_name,
    exchange_type='topic',
    durable=True
  )

  channel.queue_declare(
    queue=queue_name,
    durable=True
  )

  channel.queue_bind(
    queue=queue_name,
    exchange=exchange_name,
    routing_key=routing_key
  )

  print(' * Waiting to process payments.')
  channel.basic_consume(callback, queue=queue_name, no_ack=False)
  channel.start_consuming()

def ack_message(channel, tag):
  channel.basic_ack(delivery_tag=tag)
