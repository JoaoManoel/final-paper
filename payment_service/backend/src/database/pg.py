import os
import psycopg2
from psycopg2.extras import RealDictCursor

db_user = os.getenv('DB_USER', 'postgres')
db_pass = os.getenv('DB_PASS', '')
db_host = os.getenv('DB_HOST', '127.0.0.1')
db_port = os.getenv('DB_PORT', '5432')
db_name = os.getenv('DB_NAME', 'socks_payment')

connection_url = "host=%s port=%s user=%s dbname=%s" % (db_host, db_port, db_user, db_name)

if db_pass != '':
  connection_url += " password=%s" % db_pass

def connect_to_db():
  return psycopg2.connect(connection_url, cursor_factory=RealDictCursor)
