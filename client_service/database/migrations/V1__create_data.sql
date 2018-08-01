INSERT INTO "user"
  (email, "password", "activation_code")
VALUES
  ('joaomanoel@thissocks.com', '12345678', 'dMOcJejrrSNQtcHvt2ewT477tjd60IgCXegXB3ng'),
  ('natlia.souza26@hotmail.com', 'N1gYXICBR2L0Gqp', 'uxihlaw0j10z7sokqreg618og25i86pn4yu8dy6i'),
  ('elsio_braga80@live.com', 'JQB43al5f2EsAd4', 'khx3eatoml3zmnnxkt71x22pxm9eo48f95693xwn'),
  ('karla_xavier@gmail.com', 'N6mfeCm6gmb32S9', 'czmmamjrsowks2dawoagkbm21f0bxhjohe4njgmt'),
  ('frederico49@gmail.com', 'HrZxy56AypRxlrh', '6qjkjmgii3dpt32wpi8lk6ov46vdsgf132l2wh8h'),
  ('lorraine.martins66@gmail.com', 'kU2f6aL3rDaeYhm', '7uarkro28c1tamcg06m4o9tycmymemng3gy8hzm7'),
  ('joana94@bol.com.br', 'VwkQL1yzrdel02K', '7efktnsyc4ijqenuyypk0jnhr0wwy5fk4prggf19'),
  ('deneval.saraiva98@hotmail.com', 'Ofq7lwUyZPcK0KW', 'svb70ku8lk0pvdpn2co8lfkrnekm4qqhicuac4bl'),
  ('larissa_carvalho@gmail.com', 'nTzxbbgFMI0CDAr', 'lxvaue257t1j294v6hcvk1tf9qs8onnwtdq7nuwu'),
  ('pedro70@yahoo.com', 'ZGymMXYvLgIMpLO', '2od25wrwkgz5j0d5dynqk3mtqhoap66ozgi0bn7k'),
  ('roberta79@hotmail.com', 'HnHbb5cQfo6wAXb', 'rzt1tvk4lx6s5kstftdshi2rt7zzy3vb306eb97x'),
  ('alessandra.carvalho83@gmail.com', 'jcuFbIeGUhyhwLq', 'fk74914g3uhdqydfi0rbjl77dlg8ax8qo31yfzpu'),
  ('natlia.reis@live.com', 'kRjja5IZ8RqqmFf', 'msisfyfgsl0lrclb0kd606qmfdekzdzt3bhp9uwi');

INSERT INTO "client"
  ("name", last_name, birthday, landline_number, cellphone_number, user_id)
VALUES
  ('João Manoel', 'Lins', '09/01/1951', '(85) 3260-2222', '(85) 98888-8888', 1),
  ('Marcela', 'Santos', '02/10/1988', '(51) 4617-6380', '(51) 98881-00000', 2),
  ('Washington', 'Soares', '02/10/1991', '(80) 0732-1212', '(54) 60825-1435', 3),
  ('Silas', 'Costa', '02/10/1991', '(91) 1530-8950', '(93) 81727-4466', 4),
  ('Margarida', 'Souza', '02/10/1991', '(93) 8432-2603', '(82) 2514-7198', 5),
  ('Ígor', 'Carvalho', '02/10/1991', '(78) 8834-8771', '(88) 3605-4605', 6),
  ('Natália', 'Costa', '02/10/1991', '(36) 2156-3151', '(51) 6544-1281', 7),
  ('Marcelo', 'Nogueira', '02/10/1991', '(16) 5431-8077', '(47) 8643-3654', 8),
  ('Pedro', 'Xavier', '02/10/1991', '(42) 5445-9502', '(12) 23433-6671', 9),
  ('Alessandra', 'Oliveira', '02/10/1991', '(30) 9537-6751', '(97) 1923-2678', 10),
  ('Ladislau', 'Franco', '02/10/1991', '(42) 7534-2153', '(41) 1850-7370', 11),
  ('Silas', 'Albuquerque', '02/10/1991', '(43) 66218-9700', '(71) 9948-0789', 12);

INSERT INTO "address"
  (address_name, responsible_name,zipcode, "address", city, "state", client_id)
VALUES
  ('Casa', 'João Manoel', '67501000', 'Av Lorem Ipsum', 'Fortaleza', 'CE', 1),
  ('Casa', 'Marcela Santos', '72033000', 'Rua Barros Marginal Suite 821', 'Grande Ofélia', 'AC', 2),
  ('Casa', 'Washington Soares', '83462010', 'Av Marginal Ladislau 3614 Apt. 672', 'Tabatinga', 'AM', 3),
  ('Casa', 'Silas Costa', '60032787', 'Avenida Barros Vieira 163 APT 217', 'Guilhermedo Descoberto', 'AC', 4),
  ('Casa', 'Margarida Souza', '60566942', 'Travessa Sílvia 200 Apt. 007', 'Grande Hugo', 'PB', 5),
  ('Casa', 'Ígor Carvalho', '20550401', 'Rua Saraiva Ponte 265 Apt. 872', 'Nova Gustavo', 'PB', 6),
  ('Casa', 'Natália Costa', '80554200', 'Av Braga Avenida 49641 Apt. 069', 'Melode Nossa Senhora', 'MT', 7),
  ('Casa', 'Marcelo Nogueira', '18675447', 'Av Costa Marginal 4170 Apt. 404', 'Vila Sílvia', 'MS', 8),
  ('Casa', 'Pedro Xavier', '37404111', 'Av Eduardo Marginal 70942 Suite 690', 'Céliado Descoberto', 'ES', 9),
  ('Casa', 'Alessandra Oliveira', '88320613', 'Rua Braga Ponte 10650 Apt. 032', 'Martinsdo Descoberto', 'SC', 10),
  ('Casa', 'Ladislau Franco', '00859600', 'Rua Fábio Viela 613 Apt. 068', 'Karlade Nossa Senhora', 'RN', 11),
  ('Casa', 'Silas Albuquerque', '02281232', 'Av Moraes Ponte 60141 Suite 305', 'Márciado Descoberto', 'RR', 12);