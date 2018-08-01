def create(document, conn):
    q = """ INSERT into charge (id, amount, paid, payment_id, client_id, order_id) VALUES (%s, %s, %s, %s, %s, %s)"""
    cur = conn.cursor()
    cur.execute(q, [
      document['id'],
      document['amount'],
      document['paid'],
      document['payment_id'],
      document['client_id'],
      document['order_id']
    ])

    conn.commit()
    cur.close()

def find_charge_and_payment(payment_id, charge_id, conn):
    q = """ SELECT ch.id as charge_id, ch.attempts as attempts, ch.amount, ch.paid,
    c.id as card_id, c.last4, c.cvc,
    c.brand, c.name, c.exp_month, c.exp_year, 
    a.address_name, a.responsible_name, a.address_phone,
    a.address, a.city, a.state, a.zipcode
    FROM charge ch, card c, address a 
    WHERE ch.payment_id = c.id AND c.address_id = a.id
    AND c.id = %s AND ch.id = %s
   """

    cur = conn.cursor()
    cur.execute(q, [payment_id, charge_id])
    row = cur.fetchone()
    cur.close()

    return row

def find_failed_payments(conn):
    q = """ SELECT *, ch.id as charge_id
        FROM charge ch, card c
        WHERE attempts <= 3 
            AND ch.paid = false 
            AND ch.payment_id = c.id """

    cur = conn.cursor()
    cur.execute(q, [])
    rows = cur.fetchall()
    cur.close()

    return rows

def update(is_paid, charge_id, attempts, conn):
    q = """ UPDATE charge SET paid=%s, processed_at=now(), attempts=%s WHERE id = %s """
    cur = conn.cursor()
    cur.execute(q, [is_paid, attempts, charge_id])
    conn.commit()
    cur.close()
