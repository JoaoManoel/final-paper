CREATE TYPE gender_enum AS ENUM ('Masculino', 'Feminino');
CREATE TYPE sock_size_enum AS ENUM ('R', '0', '1', '2', '3', '4', '5', '6', '7');
CREATE TYPE review_stars_enum AS ENUM ('0','1','2','3','4','5');

CREATE TABLE "user" (
  id SERIAL NOT NULL,
  email varchar(100) UNIQUE NOT NULL,
  password varchar(255) NOT NULL,
  is_activated boolean default false,
  activation_code varchar(100) NOT NUll,
  CONSTRAINT user_id PRIMARY KEY (id)
);

CREATE TABLE client (
  id SERIAL NOT NULL,
  name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  birthday varchar(255),
  landline_number varchar(50),
  cellphone_number varchar(50),
  user_id integer UNIQUE NOT NULL,
  CONSTRAINT client_id PRIMARY KEY (id),
  CONSTRAINT client_user_id_fkey FOREIGN KEY (user_id)
    REFERENCES "user" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE CASCADE 
);

CREATE TABLE "address" (
  id SERIAL NOT NULL,
  address_name varchar(255) NOT NULL,
  responsible_name varchar(255),
  address_phone varchar(50),
  zipcode varchar(50) NOT NULL,
  address varchar(255) NOT NULL,
  state varchar(255) NOT NULL,
  city varchar(255) NOT NULL,
  client_id integer NOT NULL,
  CONSTRAINT address_id PRIMARY KEY (id),
  CONSTRAINT address_client_id_fkey FOREIGN KEY (client_id)
    REFERENCES client (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE CATEGORY (
  id SERIAL NOT NULL,
  name VARCHAR(100) NOT NULL,
  gender gender_enum NOT NULL,
  CONSTRAINT category_pkey PRIMARY KEY (id)
);

CREATE TABLE PRODUCT (
  id SERIAL NOT NULL,
  name VARCHAR(80) UNIQUE NOT NULL,
  description TEXT NOT NULL,
  detail TEXT,
  price float NOT NULL,
  category_id INTEGER NOT NULL,
  weight float NOT NULL,
  CONSTRAINT product_pkey PRIMARY KEY (id),
  CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id)
    REFERENCES CATEGORY (id) MATCH SIMPLE 
    ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE MODEL (
  id SERIAL NOT NULL,
  sku varchar(20) UNIQUE NOT NULL,
  size sock_size_enum NOT NULL,
  color varchar(100) NOT NULL,
  product_id integer NOT NULL,
  CONSTRAINT model_id PRIMARY KEY (id),
  CONSTRAINT model_product_id_fkey FOREIGN KEY (product_id)
    REFERENCES product (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE CASCADE
);

CREATE TABLE inventory ( 
  id SERIAL NOT NULL,
  stock_total bigint NOT NULL,
  stock_reserved bigint NOT NULL DEFAULT 0,
  sku varchar(20) NOT NULL UNIQUE,
  CONSTRAINT inventory_id PRIMARY KEY (id),
  CONSTRAINT inventory_model_sku_fkey FOREIGN KEY (sku)
    REFERENCES model (sku) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE CASCADE
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
  CONSTRAINT card_client_id_fkey FOREIGN KEY (client_id)
    REFERENCES "client" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE CASCADE,
  CONSTRAINT card_address_id_fkey FOREIGN KEY (address_id)
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
  CONSTRAINT charge_payment_id_fkey FOREIGN KEY (payment_id)
    REFERENCES "card" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT charge_client_id FOREIGN KEY (client_id)
    REFERENCES "client" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE "recommendation" (
  id SERIAL NOT NULL,
  sku varchar(20) NOT NULL UNIQUE,
  category_id INTEGER NOT NULL,
  sales_number INTEGER DEFAULT 0,
  CONSTRAINT recommendation_id PRIMARY KEY (id),
  CONSTRAINT recommendation_category_id_fkey FOREIGN KEY (category_id)
    REFERENCES "category" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE REVIEW (
  id SERIAL NOT NULL,
  client_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  review_date DATE NOT NULL,
  stars review_stars_enum NOT NULL,
  title VARCHAR(40),
  comment text,
  CONSTRAINT review_pkey PRIMARY KEY (id),
  CONSTRAINT review_client_id_fkey FOREIGN KEY (client_id)
    REFERENCES "client" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT review_product_id_fkey FOREIGN KEY (product_id)
    REFERENCES "product" (id) MATCH SIMPLE
    ON UPDATE NO ACTION ON DELETE CASCADE
);
