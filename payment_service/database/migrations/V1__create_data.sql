INSERT INTO "address"
  (address_name, responsible_name,zipcode, "address", city, "state")
VALUES
  ('Casa', 'João Manoel', '67501000', 'Av Lorem Ipsum', 'Fortaleza', 'CE'),
  ('Casa', 'Marcela Santos', '72033000', 'Rua Barros Marginal Suite 821', 'Grande Ofélia', 'AC'),
  ('Casa', 'Washington Soares', '83462010', 'Av Marginal Ladislau 3614 Apt. 672', 'Tabatinga', 'AM'),
  ('Casa', 'Silas Costa', '60032787', 'Avenida Barros Vieira 163 APT 217', 'Guilhermedo Descoberto', 'AC'),
  ('Casa', 'Margarida Souza', '60566942', 'Travessa Sílvia 200 Apt. 007', 'Grande Hugo', 'PB'),
  ('Casa', 'Ígor Carvalho', '20550401', 'Rua Saraiva Ponte 265 Apt. 872', 'Nova Gustavo', 'PB'),
  ('Casa', 'Natália Costa', '80554200', 'Av Braga Avenida 49641 Apt. 069', 'Melode Nossa Senhora', 'MT'),
  ('Casa', 'Marcelo Nogueira', '18675447', 'Av Costa Marginal 4170 Apt. 404', 'Vila Sílvia', 'MS'),
  ('Casa', 'Pedro Xavier', '37404111', 'Av Eduardo Marginal 70942 Suite 690', 'Céliado Descoberto', 'ES'),
  ('Casa', 'Alessandra Oliveira', '88320613', 'Rua Braga Ponte 10650 Apt. 032', 'Martinsdo Descoberto', 'SC'),
  ('Casa', 'Ladislau Franco', '00859600', 'Rua Fábio Viela 613 Apt. 068', 'Karlade Nossa Senhora', 'RN'),
  ('Casa', 'Silas Albuquerque', '02281232', 'Av Moraes Ponte 60141 Suite 305', 'Márciado Descoberto', 'RR');


INSERT INTO "public"."card"
  ("id","number","exp_month","exp_year","cvc","name","brand","last4","client_id","address_id")
VALUES
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b51',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',1,1),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b52',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',2,2),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b53',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',3,3),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b54',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',4,4),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b55',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',5,5),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b56',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',6,6),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b57',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',7,7),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b58',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',8,8),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b5a',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',9,9),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b5b',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',10,10),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b5c',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',11,11),
  (E'card_78b2ce43-15e2-497b-8fcc-275218978b5d',E'4242424242424242',12,2019,E'3334',NULL,E'visa',E'4242',12,12);
