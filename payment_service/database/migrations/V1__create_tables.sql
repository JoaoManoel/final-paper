CREATE TABLE "address" (
  id SERIAL NOT NULL,
  address_name varchar(255) NOT NULL,
  responsible_name varchar(255),
  address_phone varchar(50),
  zipcode varchar(50) NOT NULL,
  "address" varchar(255) NOT NULL,
  "state" varchar(255) NOT NULL,
  city varchar(255) NOT NULL,
  CONSTRAINT card_address_id PRIMARY KEY (id)
);

CREATE TABLE "card" (
  id varchar(100) NOT NULL,
  "number" varchar(16) NOT NULL,
  exp_month integer NOT NULL,
  exp_year integer NOT NULL,
  cvc varchar(4) NOT NULL,
  "name" varchar(100),
  brand varchar(50) default '',
  last4 varchar(4) default '',
  client_id integer NOT NULL,
  address_id integer NOT NULL,
  CONSTRAINT card_id PRIMARY KEY (id),
  CONSTRAINT card_address_id FOREIGN KEY (address_id)
    REFERENCES "address" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE "charge" (
  id varchar(100) NOT NULL,
  amount float NOT NULL,
  paid bool default false,
  payment_id varchar(100) NOT NULL,
  client_id integer NOT NULL,
  order_id varchar(250) NOT NULL,
  processed_at timestamp default now(),
  attempts integer DEFAULT 1,
  CONSTRAINT charge_id PRIMARY KEY (id),
  CONSTRAINT charge_payment_id FOREIGN KEY (payment_id)
    REFERENCES "card" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
);
