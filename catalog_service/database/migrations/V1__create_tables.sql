CREATE TYPE gender_enum AS ENUM ('Masculino', 'Feminino');
CREATE TYPE sock_size_enum AS ENUM ('R', '0', '1', '2', '3', '4', '5', '6', '7');

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