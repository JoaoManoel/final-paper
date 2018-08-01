CREATE TABLE "recommendation" (
  id SERIAL NOT NULL,
  sku varchar(20) NOT NULL UNIQUE,
  category_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  sales_number INTEGER DEFAULT 0,
  CONSTRAINT recommendation_id PRIMARY KEY (id)
);