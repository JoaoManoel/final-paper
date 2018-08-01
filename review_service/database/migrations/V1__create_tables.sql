CREATE TYPE gender_enum AS ENUM ('Masculino', 'Feminino');
CREATE TYPE review_stars_enum AS ENUM ('0','1','2','3','4','5');

CREATE TABLE REVIEW (
  id SERIAL NOT NULL,
  client_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  review_date DATE NOT NULL,
  stars review_stars_enum NOT NULL,
  title VARCHAR(40),
  comment text,
  CONSTRAINT review_pkey PRIMARY KEY (id)
);
