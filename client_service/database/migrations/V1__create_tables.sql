
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
  birthday date,
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