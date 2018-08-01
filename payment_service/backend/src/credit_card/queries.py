def save(table, document, conn):
  keys = ",".join(list(document.keys()))
  values = ",".join(["%s" for _ in list(document.values())])
  q = """INSERT INTO %s (%s) VALUES (%s) RETURNING id""" % (table, keys, values)

  cur = conn.cursor()
  cur.execute(q, list(document.values()))

  id = cur.fetchone()['id']
  cur.close()

  return id

def find_by_id(client_id, card_id, conn):
  q = """SELECT c.id, c.last4, 
    c.brand, c.name, c.exp_month, c.exp_year, 
    a.address_name, a.responsible_name, a.address_phone,
    a.address, a.city, a.state, a.zipcode
    FROM card c, address a 
    WHERE c.address_id = a.id 
    AND c.id = %s AND c.client_id = %s"""

  cur = conn.cursor()
  cur.execute(q, [card_id, client_id])
  row = cur.fetchone()
  cur.close()

  return row

### Does the same by the find_by_id method
### but we will return the cvc. We will use this cvc to check
### if client send the same cvc
def __find_by_id(client_id, card_id, conn):
  q = """SELECT c.id, c.last4, c.cvc,
    c.brand, c.name, c.exp_month, c.exp_year, 
    a.address_name, a.responsible_name, a.address_phone,
    a.address, a.city, a.state, a.zipcode
    FROM card c, address a 
    WHERE c.address_id = a.id 
    AND c.id = %s AND c.client_id = %s"""

  cur = conn.cursor()
  cur.execute(q, [card_id, client_id])
  row = cur.fetchone()
  cur.close()

  return row

def find_address_by_card_id(card_id, conn):
  q = """SELECT a.* FROM card c, address a 
    WHERE c.address_id = a.id AND c.id = %s"""

  cur = conn.cursor()
  cur.execute(q, [card_id])
  row = cur.fetchone()
  cur.close()

  return row

def list_all(client_id, conn):
  q = """SELECT c.id, c.last4, 
  c.brand, c.name, c.exp_month, c.exp_year, 
  a.address_name, a.responsible_name, a.address_phone,
  a.address, a.city, a.state, a.zipcode
  FROM card c, address a 
  WHERE c.address_id = a.id 
  AND c.client_id = %s"""

  cur = conn.cursor()
  cur.execute(q, [client_id])
  rows = cur.fetchall()
  cur.close()

  return rows

def update_address(address_id, document, conn):
  # remove key id
  document.pop('id', None)
  keys = "=%s, ".join(list(document.keys())) + ' =%s'
  values = list(document.values())
  values.insert(len(values), address_id)

  q = """UPDATE address SET %s WHERE id = %s""" % (keys, "%s")
  cur = conn.cursor()
  cur.execute(q, values)
  rows_count = cur.rowcount

  conn.commit()
  cur.close()
  return rows_count > 0

def update_card(card_id, document, conn):
  # remove key id
  document.pop('id', None)
  keys = "=%s, ".join(list(document.keys())) + ' =%s'
  values = list(document.values())
  values.insert(len(values), card_id)

  q = """UPDATE card SET %s WHERE id = %s""" % (keys, "%s")
  cur = conn.cursor()
  cur.execute(q, values)
  rows_count = cur.rowcount

  conn.commit()
  cur.close()
  return rows_count > 0

def delete(client_id, card_id, conn):
  q = """DELETE FROM card where client_id = %s AND id = %s"""
  cur = conn.cursor()
  cur.execute(q, [client_id, card_id])
  rows_count = cur.rowcount
  
  conn.commit()
  cur.close()

  return rows_count > 0