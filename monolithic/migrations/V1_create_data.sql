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

INSERT INTO CATEGORY
  (name, gender)
VALUES
  ('Social', 'Masculino');
INSERT INTO CATEGORY
  (name, gender)
VALUES
  ('Esportiva', 'Masculino');
INSERT INTO CATEGORY
  (name, gender)
VALUES
  ('Casual', 'Masculino');

INSERT INTO CATEGORY
  (name, gender)
VALUES
  ('Esportiva', 'Feminino');
INSERT INTO CATEGORY
  (name, gender)
VALUES
  ('Casual', 'Feminino');

-- Homens
INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA SOCIAL CANO LONGO ALGODÃO LISA MASCULINA',
    'Meia social masculina lisa 100% algodão. Confeccionada para homens que não dispensam os benefícios da fibra natural, a meia é ideal para utilizar com sapatos sociais.',
    'Modelo	Cano Longo\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    11.90, 1);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA SOCIAL CANO LONGO POLIAMIDA LISA MASCULINA',
    'Meia social masculina lisa 100% poliamida. Ideal para utilizar com sapatos sociais, as meias possuem cores clássicas e elegantes.',
    'Modelo	Cano Longo\n
Material	Poliamida\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    9.90, 1);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA SOCIAL CANO LONGO POLIAMIDA CANELADA',
    'Meia social masculina canelada 100% poliamida. Ideal para utilizar com sapatos sociais, o canelado confere um detalhe especial para as meias que possuem cores clássicas e elegantes.',
    'Modelo	Cano Longo\n
Material	Poliamida\n
Design	Canelada\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    9.90, 1);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('KIT MEIA INVISÍVEL 3 PARES - MASC',
    'Kit com 3 pares de meias, modelo invisível com logo discreto da Mash. O conjunto possui combinações de cores básicas e comprimento discreto para não aparecer no tênis.',
    'Modelo	Invisível\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Kit 3 Pares',
    0.36,
    23.90, 2);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('KIT MEIA INVISÍVEL 6 PARES - MASC',
    'Kit com 6 pares de meias, modelo invisível com logo discreto da Mash. O conjunto possui combinações de cores básicas e comprimento discreto para não aparecer no tênis.',
    'Modelo	Invisível\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Kit 6 Pares\n',
    0.72,
    33.3, 2);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA INVISÍVEL INDIVIDUAL - MASC',
    'Modelo invisível com logo discreto da Mash. Possui comprimento discreto para não aparecer no tênis.',
    'Modelo	Invisível\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    9.99, 2);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA SAPATILHA ALTA PERFORMANCE MASCULINA',
    'Meia masculina com cano longo Mash. Desenvolvida com 80% de algodão e punho canelado, a meia garante total conforto. O modelo é ideal para utilizar com tênis e as cores básicas são perfeitas para os homens discretos.',
    'Detalhes do produto\n
Modelo	Cano Longo\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    10.90, 2);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA ESPORTE CANO LONGO MASCULINA',
    'MEIA SAPATILHA ALTA PERFORMANCE MASCULINA.',
    'Detalhes do produto\n
Modelo	Soquete\n
Material	Mista\n
Design	Desenhada\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    11.90, 2);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA CASUAL CANO LONGO MASCULINA COLCCI',
    'MEIA CASUAL CANO LONGO MASCULINA COLCCI.',
    'Modelo	Cano Longo\n
Material	Mista\n
Design	Desenhada\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    13.90, 3);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('KIT 3 PARES MEIA MASCULINA CANO MÉDIO',
    'KIT 3 PARES MEIA MASCULINA CANO MÉDIO.',
    'Modelo	Cano Médio\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Kit 3 Pares',
    0.36,
    25.90, 3);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA SEM PUNHO MASCULINA',
    'Meia sem punho com cano curto Mash. Desenvolvida especialmente para pessoas que procuram o conforto e o cuidado deste punho, o modelo possui o logo Mash discreto na parte frontal do pé.',
    'Modelo	Cano Baixo\n
Material	Algodão\n
Design	Lisa\n
Punho	Não\n
Embalagem	Unitário',
    0.12,
    13.90, 3);

-- Mulheres
INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('KIT MEIA INVISÍVEL 3 PARES - FEM',
    'Kit com 3 pares de meias, modelo invisível com logo discreto da Mash. O conjunto possui combinações de cores básicas e comprimento discreto para não aparecer no tênis.',
    'Modelo	Invisível\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Kit 3 Pares',
    0.36,
    23.90, 4);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('KIT MEIA INVISÍVEL 6 PARES - FEM',
    'Kit com 6 pares de meias, modelo invisível com logo discreto da Mash. O conjunto possui combinações de cores básicas e comprimento discreto para não aparecer no tênis.',
    'Modelo	Invisível\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Kit 6 Pares\n',
    0.72,
    33.3, 4);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA INVISÍVEL INDIVIDUAL - FEM',
    'Modelo invisível com logo discreto da Mash. Possui comprimento discreto para não aparecer no tênis.',
    'Modelo	Invisível\n
Material	Algodão\n
Design	Lisa\n
Punho	Sim\n
Embalagem	Unitário\n',
    0.12,
    9.99, 4);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA SAPATILHA ALTA PERFORMANCE FEMININA',
    'MEIA SAPATILHA ALTA PERFORMANCE FEMININA.',
    'Detalhes do produto\n
Modelo	Soquete\n
Material	Mista\n
Design	Desenhada\n
Punho	Sim\n
Embalagem	Unitário',
    0.12,
    11.90, 4);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA CASUAL SAPATILHA PILATES',
    'MEIA CASUAL SAPATILHA PILATES.',
    'Modelo	Sapatilha\n
Material	Mista\n
Design	Desenhada\n
Punho	Não\n
Alta Performance Não\n
Embalagem	Unitário',
    0.12,
    23.90, 5);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA SOQUETE TRABALHADA FEMININA',
    'Meia soquete feminina lisa com 74% de algodão e mix de outros fios que garantem a perfeita fixação da meia. Modelo básico desenvolvido em cores lisas para todos os gostos.',
    'Modelo	Soquete
Material	Mista\n
Design	Lisa\n
Punho	Sim\n
Alta Performance	Não\n
Embalagem	Unitário',
    0.12,
    9.90, 5);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA CASUAL SEM PUNHO FEMININA',
    'MEIA CASUAL SEM PUNHO FEMININA',
    'Modelo	Cano Médio\n
Material	Mista\n
Design	Lisa\n
Punho	Não\n
Alta Performance	Não\n
Embalagem	Unitário',
    0.12,
    13.90, 5);

INSERT INTO PRODUCT
  (name, description, detail, weight, price, category_id)
VALUES
  ('MEIA CASUAL SOQUETE COLCCI',
    'MEIA CASUAL SOQUETE COLCCI',
    'Modelo	Soquete\n
Material	Mista\n
Design	Canelada\n
Punho	Sim\n
Alta Performance	Não\n
Embalagem	Unitário',
    0.12,
    13.90, 5);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOMA-0020',
    '5',
    'AZUL MARINHO',
    1
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOMA-0021',
    '6',
    'AZUL MARINHO',
    1
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOMA-0022',
    '7',
    'AZUL MARINHO',
    1
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOMA-0023',
    '6',
    'AZUL MARINHO',
    1
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'FILG-0156',
    '6',
    'MARROM',
    1
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'FILG-0157',
    '5',
    'MARROM',
    1
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'LUCL-9150',
    '6',
    'AZUL MARINHO',
    2
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'LUCL-9151',
    '6',
    'BRANCO',
    2
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'LUCL-9152',
    '6',
    'CAQUI',
    2
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'LUCL-9153',
    '6',
    'CINZA CLARO',
    2
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'LUCL-9154',
    '6',
    'MARROM',
    2
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'LUCL-9155',
    '6',
    'PRETO',
    2
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1410',
    '4',
    'PRETO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1411',
    '5',
    'PRETO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1412',
    '6',
    'PRETO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1413',
    '7',
    'PRETO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1414',
    '4',
    'CINZA MESCLA',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1415',
    '5',
    'CINZA MESCLA',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1416',
    '6',
    'CINZA MESCLA',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1417',
    '7',
    'CINZA MESCLA',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1418',
    '4',
    'BRANCO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1419',
    '5',
    'BRANCO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1420',
    '6',
    'BRANCO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1421',
    '7',
    'BRANCO',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1422',
    '4',
    'MISTA',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1423',
    '5',
    'MISTA',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1424',
    '6',
    'MISTA',
    3
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MATL-1425',
    '7',
    'MISTA',
    3
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1900',
    '4',
    'PRETO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1901',
    '5',
    'PRETO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1902',
    '6',
    'PRETO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1903',
    '7',
    'PRETO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1904',
    '4',
    'CINZA MESCLA',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1905',
    '5',
    'CINZA MESCLA',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1906',
    '6',
    'CINZA MESCLA',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1907',
    '7',
    'CINZA MESCLA',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1908',
    '4',
    'BRANCO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1909',
    '5',
    'BRANCO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1910',
    '6',
    'BRANCO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1911',
    '7',
    'BRANCO',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1912',
    '4',
    'MISTA',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1913',
    '5',
    'MISTA',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1914',
    '6',
    'MISTA',
    4
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOFM-1915',
    '7',
    'MISTA',
    4
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1900',
    '4',
    'PRETO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1901',
    '5',
    'PRETO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1902',
    '6',
    'PRETO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1903',
    '7',
    'PRETO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1904',
    '4',
    'CINZA MESCLA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1905',
    '5',
    'CINZA MESCLA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1906',
    '6',
    'CINZA MESCLA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1907',
    '7',
    'CINZA MESCLA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1908',
    '4',
    'BRANCO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1909',
    '5',
    'BRANCO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1910',
    '6',
    'BRANCO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1911',
    '7',
    'BRANCO',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1912',
    '4',
    'MISTA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1913',
    '5',
    'MISTA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1914',
    '6',
    'MISTA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOAC-1915',
    '7',
    'MISTA',
    5
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0600',
    '4',
    'PRETO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0601',
    '5',
    'PRETO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0602',
    '6',
    'PRETO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0603',
    '7',
    'PRETO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0604',
    '4',
    'CINZA MESCLA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0605',
    '5',
    'CINZA MESCLA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0606',
    '6',
    'CINZA MESCLA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0607',
    '7',
    'CINZA MESCLA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0608',
    '4',
    'BRANCO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0609',
    '5',
    'BRANCO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0610',
    '6',
    'BRANCO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0611',
    '7',
    'BRANCO',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0612',
    '4',
    'MISTA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0613',
    '5',
    'MISTA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0614',
    '6',
    'MISTA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ESTL-0615',
    '7',
    'MISTA',
    6
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0604',
    '4',
    'CINZA ESCURO',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0605',
    '5',
    'CINZA ESCURO',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0606',
    '6',
    'CINZA ESCURO',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0608',
    '4',
    'BRANCO',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0609',
    '5',
    'BRANCO',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0610',
    '6',
    'BRANCO',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0612',
    '4',
    'CINZA',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0613',
    '5',
    'CINZA',
    7
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'JOFR-0614',
    '6',
    'CINZA',
    7
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0604',
    '4',
    'CINZA MESCLA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0605',
    '5',
    'CINZA MESCLA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0606',
    '6',
    'CINZA MESCLA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0607',
    '7',
    'CINZA MESCLA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0608',
    '4',
    'BRANCO',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0609',
    '5',
    'BRANCO',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0610',
    '6',
    'BRANCO',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0611',
    '7',
    'BRANCO',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0612',
    '4',
    'MISTA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0613',
    '5',
    'MISTA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0614',
    '6',
    'MISTA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'GPRIM-0615',
    '7',
    'MISTA',
    8
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ATLA-0420',
    '4',
    'AZUL MARINHO',
    9
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ATLA-0421',
    '4',
    'CINZA ESCURO',
    9
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ATLA-0422',
    '4',
    'PRETO',
    9
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALF-1986',
    '4',
    'BRANCO',
    10
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALF-1987',
    '5',
    'BRANCO',
    10
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALF-1988',
    '4',
    'MISTO',
    10
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALF-1989',
    '5',
    'MISTO',
    10
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2002',
    '5',
    'LARANJA ESCURO',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2003',
    '5',
    'ROSA PINK',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2004',
    '5',
    'AZUL JEANS',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2005',
    '5',
    'ROXO ESCURO',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2006',
    '5',
    'VERDE LIMÃO',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2007',
    '5',
    'CINZA',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2008',
    '5',
    'CINZA ESCURO',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2009',
    '5',
    'BRANCO',
    11
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'KURC-2010',
    '5',
    'PRETO',
    11
);

-- Modelos Feminino
INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-2640',
    '3',
    'PRETO',
    12
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-2641',
    '4',
    'PRETO',
    12
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-2644',
    '3',
    'CINZA MESCLA',
    12
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-2645',
    '4',
    'CINZA MESCLA',
    12
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-2648',
    '3',
    'BRANCO',
    12
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-2649',
    '4',
    'BRANCO',
    12
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-1912',
    '3',
    'MISTA',
    12
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ANAB-1913',
    '4',
    'MISTA',
    12
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-0410',
    '3',
    'PRETO',
    13
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-0411',
    '4',
    'PRETO',
    13
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-0414',
    '3',
    'CINZA MESCLA',
    13
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-0415',
    '4',
    'CINZA MESCLA',
    13
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-0418',
    '3',
    'BRANCO',
    13
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-0419',
    '4',
    'BRANCO',
    13
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-1912',
    '3',
    'MISTA',
    13
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'MARL-1913',
    '4',
    'MISTA',
    13
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1910',
    '3',
    'PRETO',
    14
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1911',
    '4',
    'PRETO',
    14
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1914',
    '3',
    'CINZA MESCLA',
    14
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1915',
    '4',
    'CINZA MESCLA',
    14
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1918',
    '3',
    'BRANCO',
    14
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1919',
    '4',
    'BRANCO',
    14
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1912',
    '3',
    'MISTA',
    14
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOMR-1913',
    '4',
    'MISTA',
    14
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2210',
    '3',
    'CINZA MESCLA',
    15
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2211',
    '4',
    'CINZA MESCLA',
    15
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2214',
    '3',
    'LILÁS',
    15
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2215',
    '4',
    'LILÁS',
    15
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2218',
    '3',
    'ROSA CLARO',
    15
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2222',
    '4',
    'ROSA CLARO',
    15
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2212',
    '3',
    'LARANJA',
    15
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'VOELZ-2213',
    '4',
    'LARANJA',
    15
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0616',
    '3',
    'AZUL ESCURO',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0611',
    '4',
    'AZUL ESCURO',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0614',
    '3',
    'PRETO 01',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0615',
    '4',
    'PRETO 01',
    16
);


INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0618',
    '3',
    'CINZA',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0619',
    '4',
    'CINZA',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0612',
    '3',
    'CINZA ESCURO',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0613',
    '4',
    'CINZA ESCURO',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0672',
    '3',
    'AZUL MARINHO',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'ALAI-0673',
    '4',
    'AZUL MARINHO',
    16
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TCONC-1800',
    '3',
    'BRANCO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TCONC-1801',
    '4',
    'BRANCO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TCONC-1802',
    '3',
    'PRETO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TCONC-1803',
    '4',
    'PRETO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TCONC-1804',
    '3',
    'ROSA CLARO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TCONC-1805',
    '4',
    'ROSA CLARO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TBER-1806',
    '3',
    'ROXO MÉDIO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TBER-1807',
    '4',
    'ROXO MÉDIO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TBER-1808',
    '3',
    'CINZA MESCLA',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TBER-1809',
    '4',
    'CINZA MESCLA',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TBER-1810',
    '3',
    'LILÁS',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TBER-1811',
    '4',
    'LILÁS',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TSAN-1812',
    '3',
    'LARANJA ESCURO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TSAN-1813',
    '4',
    'LARANJA ESCURO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TSAN-1814',
    '3',
    'CINZA ESCURO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TSAN-1815',
    '4',
    'CINZA ESCURO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TSAN-1816',
    '3',
    'VERDE CÍTRICO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TSAN-1817',
    '4',
    'VERDE CÍTRICO',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TMAR-1818',
    '3',
    'ROSA AZALEIA',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TMAR-1819',
    '4',
    'ROSA AZALEIA',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TMAR-1820',
    '3',
    'AMARELO LIMA',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TMAR-1821',
    '4',
    'AMARELO LIMA',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TMAR-1822',
    '3',
    'VIOLETA',
    17
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'TMAR-1823',
    '4',
    'VIOLETA',
    17
);
INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'APRI-2900',
    '3',
    'BRANCO',
    18
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'APRI-2901',
    '4',
    'BRANCO',
    18
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'APRI-2902',
    '3',
    'PRETO',
    18
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'APRI-2903',
    '4',
    'PRETO',
    18
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'APRI-2904',
    '3',
    'CINZA MESCLA',
    18
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'APRI-2905',
    '4',
    'CINZA MESCLA',
    18
);
INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2002',
    '5',
    'LARANJA ESCURO',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2003',
    '5',
    'ROSA PINK',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2004',
    '5',
    'AZUL JEANS',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2005',
    '5',
    'ROXO ESCURO',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2006',
    '5',
    'VERDE LIMÃO',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2007',
    '5',
    'CINZA',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2008',
    '5',
    'CINZA ESCURO',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2009',
    '5',
    'BRANCO',
    19
);

INSERT INTO MODEL
  (sku, size, color, product_id)
VALUES
  (
    'DOG-2010',
    '5',
    'PRETO',
    19
);

INSERT INTO "public"."inventory"
  ("sku","stock_total","stock_reserved")
VALUES
  (E'JOMA-0020',300000000000000000,0),
  (E'JOMA-0021',300000000000000000,0),
  (E'JOMA-0022',300000000000000000,0),
  (E'JOMA-0023',300000000000000000,0),
  (E'FILG-0156',300000000000000000,0),
  (E'FILG-0157',300000000000000000,0),
  (E'LUCL-9150',300000000000000000,0),
  (E'LUCL-9151',300000000000000000,0),
  (E'LUCL-9152',300000000000000000,0),
  (E'LUCL-9153',300000000000000000,0),
  (E'LUCL-9154',300000000000000000,0),
  (E'LUCL-9155',300000000000000000,0),
  (E'MATL-1410',300000000000000000,0),
  (E'MATL-1411',300000000000000000,0),
  (E'MATL-1412',300000000000000000,0),
  (E'MATL-1413',300000000000000000,0),
  (E'MATL-1414',300000000000000000,0),
  (E'MATL-1415',300000000000000000,0),
  (E'MATL-1416',300000000000000000,0),
  (E'MATL-1417',300000000000000000,0),
  (E'MATL-1418',300000000000000000,0),
  (E'MATL-1419',300000000000000000,0),
  (E'MATL-1420',300000000000000000,0),
  (E'MATL-1421',300000000000000000,0),
  (E'MATL-1422',300000000000000000,0),
  (E'MATL-1423',300000000000000000,0),
  (E'MATL-1424',300000000000000000,0),
  (E'MATL-1425',300000000000000000,0),
  (E'VOFM-1900',300000000000000000,0),
  (E'VOFM-1901',300000000000000000,0),
  (E'VOFM-1902',300000000000000000,0),
  (E'VOFM-1903',300000000000000000,0),
  (E'VOFM-1904',300000000000000000,0),
  (E'VOFM-1905',300000000000000000,0),
  (E'VOFM-1906',300000000000000000,0),
  (E'VOFM-1907',300000000000000000,0),
  (E'VOFM-1908',300000000000000000,0),
  (E'VOFM-1909',300000000000000000,0),
  (E'VOFM-1910',300000000000000000,0),
  (E'VOFM-1911',300000000000000000,0),
  (E'VOFM-1912',300000000000000000,0),
  (E'VOFM-1913',300000000000000000,0),
  (E'VOFM-1914',300000000000000000,0),
  (E'VOFM-1915',300000000000000000,0),
  (E'VOAC-1900',300000000000000000,0),
  (E'VOAC-1901',300000000000000000,0),
  (E'VOAC-1902',300000000000000000,0),
  (E'VOAC-1903',300000000000000000,0),
  (E'VOAC-1904',300000000000000000,0),
  (E'VOAC-1905',300000000000000000,0),
  (E'VOAC-1906',300000000000000000,0),
  (E'VOAC-1907',300000000000000000,0),
  (E'VOAC-1908',300000000000000000,0),
  (E'VOAC-1909',300000000000000000,0),
  (E'VOAC-1910',300000000000000000,0),
  (E'VOAC-1911',300000000000000000,0),
  (E'VOAC-1912',300000000000000000,0),
  (E'VOAC-1913',300000000000000000,0),
  (E'VOAC-1914',300000000000000000,0),
  (E'VOAC-1915',300000000000000000,0),
  (E'ESTL-0600',300000000000000000,0),
  (E'ESTL-0601',300000000000000000,0),
  (E'ESTL-0602',300000000000000000,0),
  (E'ESTL-0603',300000000000000000,0),
  (E'ESTL-0604',300000000000000000,0),
  (E'ESTL-0605',300000000000000000,0),
  (E'ESTL-0606',300000000000000000,0),
  (E'ESTL-0607',300000000000000000,0),
  (E'ESTL-0608',300000000000000000,0),
  (E'ESTL-0609',300000000000000000,0),
  (E'ESTL-0610',300000000000000000,0),
  (E'ESTL-0611',300000000000000000,0),
  (E'ESTL-0612',300000000000000000,0),
  (E'ESTL-0613',300000000000000000,0),
  (E'ESTL-0614',300000000000000000,0),
  (E'ESTL-0615',300000000000000000,0),
  (E'JOFR-0604',300000000000000000,0),
  (E'JOFR-0605',300000000000000000,0),
  (E'JOFR-0606',300000000000000000,0),
  (E'JOFR-0608',300000000000000000,0),
  (E'JOFR-0609',300000000000000000,0),
  (E'JOFR-0610',300000000000000000,0),
  (E'JOFR-0612',300000000000000000,0),
  (E'JOFR-0613',300000000000000000,0),
  (E'JOFR-0614',300000000000000000,0),
  (E'GPRIM-0604',300000000000000000,0),
  (E'GPRIM-0605',300000000000000000,0),
  (E'GPRIM-0606',300000000000000000,0),
  (E'GPRIM-0607',300000000000000000,0),
  (E'GPRIM-0608',300000000000000000,0),
  (E'GPRIM-0609',300000000000000000,0),
  (E'GPRIM-0610',300000000000000000,0),
  (E'GPRIM-0611',300000000000000000,0),
  (E'GPRIM-0612',300000000000000000,0),
  (E'GPRIM-0613',300000000000000000,0),
  (E'GPRIM-0614',300000000000000000,0),
  (E'GPRIM-0615',300000000000000000,0),
  (E'ATLA-0420',300000000000000000,0),
  (E'ATLA-0421',300000000000000000,0),
  (E'ATLA-0422',300000000000000000,0),
  (E'ALF-1986',300000000000000000,0),
  (E'ALF-1987',300000000000000000,0),
  (E'ALF-1988',300000000000000000,0),
  (E'ALF-1989',300000000000000000,0),
  (E'KURC-2002',300000000000000000,0),
  (E'KURC-2003',300000000000000000,0),
  (E'KURC-2004',300000000000000000,0),
  (E'KURC-2005',300000000000000000,0),
  (E'KURC-2006',300000000000000000,0),
  (E'KURC-2007',300000000000000000,0),
  (E'KURC-2008',300000000000000000,0),
  (E'KURC-2009',300000000000000000,0),
  (E'KURC-2010',300000000000000000,0),
  (E'ANAB-2640',300000000000000000,0),
  (E'ANAB-2641',300000000000000000,0),
  (E'ANAB-2644',300000000000000000,0),
  (E'ANAB-2645',300000000000000000,0),
  (E'ANAB-2648',300000000000000000,0),
  (E'ANAB-2649',300000000000000000,0),
  (E'ANAB-1912',300000000000000000,0),
  (E'ANAB-1913',300000000000000000,0),
  (E'MARL-0410',300000000000000000,0),
  (E'MARL-0411',300000000000000000,0),
  (E'MARL-0414',300000000000000000,0),
  (E'MARL-0415',300000000000000000,0),
  (E'MARL-0418',300000000000000000,0),
  (E'MARL-0419',300000000000000000,0),
  (E'MARL-1912',300000000000000000,0),
  (E'MARL-1913',300000000000000000,0),
  (E'VOMR-1910',300000000000000000,0),
  (E'VOMR-1911',300000000000000000,0),
  (E'VOMR-1914',300000000000000000,0),
  (E'VOMR-1915',300000000000000000,0),
  (E'VOMR-1918',300000000000000000,0),
  (E'VOMR-1919',300000000000000000,0),
  (E'VOMR-1912',300000000000000000,0),
  (E'VOMR-1913',300000000000000000,0),
  (E'VOELZ-2210',300000000000000000,0),
  (E'VOELZ-2211',300000000000000000,0),
  (E'VOELZ-2214',300000000000000000,0),
  (E'VOELZ-2215',300000000000000000,0),
  (E'VOELZ-2218',300000000000000000,0),
  (E'VOELZ-2222',300000000000000000,0),
  (E'VOELZ-2212',300000000000000000,0),
  (E'VOELZ-2213',300000000000000000,0),
  (E'ALAI-0616',300000000000000000,0),
  (E'ALAI-0611',300000000000000000,0),
  (E'ALAI-0614',300000000000000000,0),
  (E'ALAI-0615',300000000000000000,0),
  (E'ALAI-0618',300000000000000000,0),
  (E'ALAI-0619',300000000000000000,0),
  (E'ALAI-0612',300000000000000000,0),
  (E'ALAI-0613',300000000000000000,0),
  (E'ALAI-0672',300000000000000000,0),
  (E'ALAI-0673',300000000000000000,0),
  (E'TCONC-1800',300000000000000000,0),
  (E'TCONC-1801',300000000000000000,0),
  (E'TCONC-1802',300000000000000000,0),
  (E'TCONC-1803',300000000000000000,0),
  (E'TCONC-1804',300000000000000000,0),
  (E'TCONC-1805',300000000000000000,0),
  (E'TBER-1806',300000000000000000,0),
  (E'TBER-1807',300000000000000000,0),
  (E'TBER-1808',300000000000000000,0),
  (E'TBER-1809',300000000000000000,0),
  (E'TBER-1810',300000000000000000,0),
  (E'TBER-1811',300000000000000000,0),
  (E'TSAN-1812',300000000000000000,0),
  (E'TSAN-1813',300000000000000000,0),
  (E'TSAN-1814',300000000000000000,0),
  (E'TSAN-1815',300000000000000000,0),
  (E'TSAN-1816',300000000000000000,0),
  (E'TSAN-1817',300000000000000000,0),
  (E'TMAR-1818',300000000000000000,0),
  (E'TMAR-1819',300000000000000000,0),
  (E'TMAR-1820',300000000000000000,0),
  (E'TMAR-1821',300000000000000000,0),
  (E'TMAR-1822',300000000000000000,0),
  (E'TMAR-1823',300000000000000000,0),
  (E'APRI-2900',300000000000000000,0),
  (E'APRI-2901',300000000000000000,0),
  (E'APRI-2902',300000000000000000,0),
  (E'APRI-2903',300000000000000000,0),
  (E'APRI-2904',300000000000000000,0),
  (E'APRI-2905',300000000000000000,0),
  (E'DOG-2002',300000000000000000,0),
  (E'DOG-2003',300000000000000000,0),
  (E'DOG-2004',300000000000000000,0),
  (E'DOG-2005',300000000000000000,0),
  (E'DOG-2006',300000000000000000,0),
  (E'DOG-2007',300000000000000000,0),
  (E'DOG-2008',300000000000000000,0),
  (E'DOG-2009',300000000000000000,0),
  (E'DOG-2010',300000000000000000,0);

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

INSERT INTO recommendation
  (sku, category_id, sales_number)
VALUES
  (E'JOMA-0020',1,0),
  (E'JOMA-0021',1,0),
  (E'JOMA-0022',1,0),
  (E'JOMA-0023',1,0),
  (E'FILG-0156',1,0),
  (E'FILG-0157',1,0),
  (E'LUCL-9150',1,0),
  (E'LUCL-9151',1,0),
  (E'LUCL-9152',1,0),
  (E'LUCL-9153',1,0),
  (E'LUCL-9154',1,0),
  (E'LUCL-9155',1,0),
  (E'MATL-1410',1,0),
  (E'MATL-1411',1,0),
  (E'MATL-1412',1,0),
  (E'MATL-1413',1,0),
  (E'MATL-1414',1,0),
  (E'MATL-1415',1,0),
  (E'MATL-1416',1,0),
  (E'MATL-1417',1,0),
  (E'MATL-1418',1,0),
  (E'MATL-1419',1,0),
  (E'MATL-1420',1,0),
  (E'MATL-1421',1,0),
  (E'MATL-1422',1,0),
  (E'MATL-1423',1,0),
  (E'MATL-1424',1,0),
  (E'MATL-1425',1,0),
  (E'VOFM-1900',2,0),
  (E'VOFM-1901',2,0),
  (E'VOFM-1902',2,0),
  (E'VOFM-1903',2,0),
  (E'VOFM-1904',2,0),
  (E'VOFM-1905',2,0),
  (E'VOFM-1906',2,0),
  (E'VOFM-1907',2,0),
  (E'VOFM-1908',2,0),
  (E'VOFM-1909',2,0),
  (E'VOFM-1910',2,0),
  (E'VOFM-1911',2,0),
  (E'VOFM-1912',2,0),
  (E'VOFM-1913',2,0),
  (E'VOFM-1914',2,0),
  (E'VOFM-1915',2,0),
  (E'VOAC-1900',2,0),
  (E'VOAC-1901',2,0),
  (E'VOAC-1902',2,0),
  (E'VOAC-1903',2,0),
  (E'VOAC-1904',2,0),
  (E'VOAC-1905',2,0),
  (E'VOAC-1906',2,0),
  (E'VOAC-1907',2,0),
  (E'VOAC-1908',2,0),
  (E'VOAC-1909',2,0),
  (E'VOAC-1910',2,0),
  (E'VOAC-1911',2,0),
  (E'VOAC-1912',2,0),
  (E'VOAC-1913',2,0),
  (E'VOAC-1914',2,0),
  (E'VOAC-1915',2,0),
  (E'ESTL-0600',2,0),
  (E'ESTL-0601',2,0),
  (E'ESTL-0602',2,0),
  (E'ESTL-0603',2,0),
  (E'ESTL-0604',2,0),
  (E'ESTL-0605',2,0),
  (E'ESTL-0606',2,0),
  (E'ESTL-0607',2,0),
  (E'ESTL-0608',2,0),
  (E'ESTL-0609',2,0),
  (E'ESTL-0610',2,0),
  (E'ESTL-0611',2,0),
  (E'ESTL-0612',2,0),
  (E'ESTL-0613',2,0),
  (E'ESTL-0614',2,0),
  (E'ESTL-0615',2,0),
  (E'JOFR-0604',2,0),
  (E'JOFR-0605',2,0),
  (E'JOFR-0606',2,0),
  (E'JOFR-0608',2,0),
  (E'JOFR-0609',2,0),
  (E'JOFR-0610',2,0),
  (E'JOFR-0612',2,0),
  (E'JOFR-0613',2,0),
  (E'JOFR-0614',2,0),
  (E'GPRIM-0604',2,0),
  (E'GPRIM-0605',2,0),
  (E'GPRIM-0606',2,0),
  (E'GPRIM-0607',2,0),
  (E'GPRIM-0608',2,0),
  (E'GPRIM-0609',2,0),
  (E'GPRIM-0610',2,0),
  (E'GPRIM-0611',2,0),
  (E'GPRIM-0612',2,0),
  (E'GPRIM-0613',2,0),
  (E'GPRIM-0614',2,0),
  (E'GPRIM-0615',2,0),
  (E'ATLA-0420',3,0),
  (E'ATLA-0421',3,0),
  (E'ATLA-0422',3,0),
  (E'ALF-1986',3,0),
  (E'ALF-1987',3,0),
  (E'ALF-1988',3,0),
  (E'ALF-1989',3,0),
  (E'KURC-2002',3,0),
  (E'KURC-2003',3,0),
  (E'KURC-2004',3,0),
  (E'KURC-2005',3,0),
  (E'KURC-2006',3,0),
  (E'KURC-2007',3,0),
  (E'KURC-2008',3,0),
  (E'KURC-2009',3,0),
  (E'KURC-2010',3,0),
  (E'ANAB-2640',4,0),
  (E'ANAB-2641',4,0),
  (E'ANAB-2644',4,0),
  (E'ANAB-2645',4,0),
  (E'ANAB-2648',4,0),
  (E'ANAB-2649',4,0),
  (E'ANAB-1912',4,0),
  (E'ANAB-1913',4,0),
  (E'MARL-0410',4,0),
  (E'MARL-0411',4,0),
  (E'MARL-0414',4,0),
  (E'MARL-0415',4,0),
  (E'MARL-0418',4,0),
  (E'MARL-0419',4,0),
  (E'MARL-1912',4,0),
  (E'MARL-1913',4,0),
  (E'VOMR-1910',4,0),
  (E'VOMR-1911',4,0),
  (E'VOMR-1914',4,0),
  (E'VOMR-1915',4,0),
  (E'VOMR-1918',4,0),
  (E'VOMR-1919',4,0),
  (E'VOMR-1912',4,0),
  (E'VOMR-1913',4,0),
  (E'VOELZ-2210',4,0),
  (E'VOELZ-2211',4,0),
  (E'VOELZ-2214',4,0),
  (E'VOELZ-2215',4,0),
  (E'VOELZ-2218',4,0),
  (E'VOELZ-2222',4,0),
  (E'VOELZ-2212',4,0),
  (E'VOELZ-2213',4,0),
  (E'ALAI-0616',5,0),
  (E'ALAI-0611',5,0),
  (E'ALAI-0614',5,0),
  (E'ALAI-0615',5,0),
  (E'ALAI-0618',5,0),
  (E'ALAI-0619',5,0),
  (E'ALAI-0612',5,0),
  (E'ALAI-0613',5,0),
  (E'ALAI-0672',5,0),
  (E'ALAI-0673',5,0),
  (E'TCONC-1800',5,0),
  (E'TCONC-1801',5,0),
  (E'TCONC-1802',5,0),
  (E'TCONC-1803',5,0),
  (E'TCONC-1804',5,0),
  (E'TCONC-1805',5,0),
  (E'TBER-1806',5,0),
  (E'TBER-1807',5,0),
  (E'TBER-1808',5,0),
  (E'TBER-1809',5,0),
  (E'TBER-1810',5,0),
  (E'TBER-1811',5,0),
  (E'TSAN-1812',5,0),
  (E'TSAN-1813',5,0),
  (E'TSAN-1814',5,0),
  (E'TSAN-1815',5,0),
  (E'TSAN-1816',5,0),
  (E'TSAN-1817',5,0),
  (E'TMAR-1818',5,0),
  (E'TMAR-1819',5,0),
  (E'TMAR-1820',5,0),
  (E'TMAR-1821',5,0),
  (E'TMAR-1822',5,0),
  (E'TMAR-1823',5,0),
  (E'APRI-2900',5,0),
  (E'APRI-2901',5,0),
  (E'APRI-2902',5,0),
  (E'APRI-2903',5,0),
  (E'APRI-2904',5,0),
  (E'APRI-2905',5,0),
  (E'DOG-2002',5,0),
  (E'DOG-2003',5,0),
  (E'DOG-2004',5,0),
  (E'DOG-2005',5,0),
  (E'DOG-2006',5,0),
  (E'DOG-2007',5,0),
  (E'DOG-2008',5,0),
  (E'DOG-2009',5,0),
  (E'DOG-2010',5,0);

INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 19, now(), '2', 'perferendis blanditiis rerum', 'Doloremque pariatur eos. Voluptatem aliquid nulla est. Dolor suscipit facere cumque provident voluptas vitae.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 7, now(), '4', 'quas doloribus quos', 'Vero consequatur minus reprehenderit molestiae nostrum perferendis. Nemo ullam iusto inventore. Nostrum consequatur maxime ut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 3, now(), '3', 'odio aliquam nam', 'Quis quod quia. Dolor rerum quisquam minima omnis saepe expedita. Et et maxime suscipit deserunt corrupti assumenda commodi quia. Possimus suscipit ut tempore eveniet expedita voluptatibus veritatis inventore dolore.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 3, now(), '2', 'aut temporibus animi', 'Ducimus quos ipsam aut. Qui asperiores illum aliquid iure atque.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 19, now(), '4', 'tempora fuga voluptas', 'Deserunt dicta illo eum aut eaque. Beatae recusandae deserunt quis nemo perferendis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 19, now(), '4', 'eos explicabo vero', 'Quae qui earum possimus nesciunt qui dolores natus eos et. Porro modi accusamus molestiae vero ut modi. Dolores voluptatibus in. Assumenda et pariatur qui pariatur.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 1, now(), '0', 'blanditiis quaerat assumenda', 'Provident ea veniam temporibus ut eum qui itaque voluptatibus. Sapiente sit saepe dolore totam quia.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 5, now(), '1', 'minus itaque eius', 'Ducimus aliquid laborum ut veritatis. Est voluptatum nostrum odio. Odit quaerat pariatur omnis nesciunt minus rerum ab.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 6, now(), '5', 'voluptas repudiandae enim', 'Quia eum quibusdam asperiores vitae sint culpa molestiae velit officia. Ea cupiditate odit quam ea qui reprehenderit omnis animi. Voluptatem accusantium iste.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 6, now(), '3', 'est vel quia', 'Nobis maiores voluptas. Suscipit esse ut blanditiis officia nihil totam atque. Sapiente eaque totam sit error blanditiis ipsum iusto necessitatibus.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 14, now(), '5', 'deleniti ex quaerat', 'Sit voluptatem quos voluptatum sapiente non debitis et dicta.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 16, now(), '0', 'officia impedit non', 'Accusamus ut quos ea tempora repudiandae dignissimos est qui. Et consequatur architecto sint omnis soluta et pariatur. Qui aut maxime rerum fugit. Laboriosam autem quasi iste quidem voluptate.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 15, now(), '3', 'debitis nisi ipsam', 'Quo sed nobis deleniti. Et eius enim adipisci expedita animi adipisci.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 13, now(), '2', 'omnis sunt quam', 'Eligendi et atque velit officia omnis dolore consectetur. Et debitis et molestias.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 6, now(), '0', 'et quia aliquam', 'Est ducimus possimus dolorem consequatur. Maiores assumenda qui. Magni non maxime.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 9, now(), '4', 'sint rerum magnam', 'Quis fugiat impedit dolor.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 10, now(), '3', 'enim qui possimus', 'Beatae delectus dignissimos aliquid voluptatem nihil non officia quo ut. Vitae cum dicta aliquam officia delectus magni aut corrupti eum. Nisi accusamus illo quia corrupti omnis et dolor eius.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 6, now(), '0', 'consequatur suscipit aut', 'Molestiae repellat sunt quos nesciunt error. Soluta et dicta amet aut eveniet possimus corporis sit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 16, now(), '0', 'omnis voluptatum eaque', 'Nihil eaque temporibus autem aut aliquam dolorum. Laudantium sed voluptatum vel magni occaecati maiores aut dicta. Consequatur rerum autem qui ex. Quia sint voluptatum minima cupiditate praesentium vel illum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 6, now(), '2', 'et deleniti consequatur', 'Ipsa voluptatibus accusantium.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 2, now(), '4', 'nobis qui officiis', 'Ut repudiandae id est qui necessitatibus et fugiat nemo magnam. Qui nam magnam vel alias sunt. Et reprehenderit beatae. Consequuntur sint reprehenderit qui est et dolores aspernatur sit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 14, now(), '2', 'rerum sint in', 'Est odit quo alias animi. Consequuntur ea aut veritatis. Voluptates est alias fugiat quas et sit eos. Et aut quas sed et nisi voluptas.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 12, now(), '1', 'pariatur velit voluptas', 'Aut id consequatur ut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 16, now(), '5', 'qui optio dolores', 'Cumque commodi praesentium. Dolorem et suscipit et officiis voluptas corrupti est voluptate. Placeat nisi omnis. Omnis nihil quisquam accusamus et adipisci ratione dolores.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 7, now(), '5', 'nam est libero', 'Aut velit eius molestiae quibusdam dicta mollitia. Et voluptas ut molestiae exercitationem pariatur rerum iusto est commodi. Porro nesciunt laudantium distinctio laborum qui aperiam.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 9, now(), '5', 'quaerat sint iste', 'Ullam ut ut est aliquid rerum sunt.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 1, now(), '0', 'voluptatum aut pariatur', 'Et est eligendi rerum. Non voluptatum earum aut rem similique.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 17, now(), '0', 'necessitatibus dolore in', 'Magni animi ut. Eos quod consequatur qui velit autem officiis aspernatur neque ea. Ipsum ut quo libero sequi rem ut nisi facere.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 11, now(), '4', 'est qui fuga', 'Voluptatem occaecati quisquam architecto veritatis ducimus blanditiis et. Et minima nobis officia nihil incidunt incidunt nihil dolor. Sapiente optio et et sint sed iusto dignissimos distinctio. Atque odio nostrum ex reprehenderit modi rerum ut expedita pariatur.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 12, now(), '2', 'sit libero doloremque', 'Nam et odit voluptates ex nam accusantium.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 1, now(), '3', 'tenetur et repudiandae', 'Qui aperiam ullam.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 3, now(), '2', 'distinctio tempora veniam', 'Aut distinctio laborum. Qui suscipit nesciunt quis ut earum maiores eveniet.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 14, now(), '3', 'labore adipisci quasi', 'Id nobis dolores reiciendis minus voluptatem quos laudantium. Itaque tempora maxime vero illum exercitationem velit ut veniam.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 1, now(), '4', 'nihil voluptatem aut', 'Esse pariatur quaerat dicta eveniet cum libero nostrum a facere.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 14, now(), '2', 'excepturi similique ad', 'Sed eius qui velit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 18, now(), '4', 'quo et quia', 'Id omnis qui porro. Magnam deleniti vitae eos et illo ut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 13, now(), '5', 'voluptas at nostrum', 'Vitae laudantium eaque quae. Qui expedita consequuntur dicta incidunt. Sequi cum qui commodi tempore.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 9, now(), '1', 'sed at debitis', 'Alias itaque possimus reprehenderit officiis libero officiis quo unde commodi. Praesentium ut ut aperiam placeat ab sunt accusamus maxime ut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 7, now(), '5', 'ut architecto exercitationem', 'Veritatis qui non odio consectetur autem saepe.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 2, now(), '3', 'ea quae voluptas', 'Incidunt a ad in saepe nihil voluptatibus.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 15, now(), '4', 'qui quia saepe', 'Natus qui nostrum laudantium ratione eos nihil ex velit veritatis. Quis reprehenderit dolores ipsa fuga distinctio cupiditate iusto qui eum. Aliquid odit ipsa earum velit in.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 1, now(), '4', 'consequatur et ut', 'Autem reiciendis culpa et odio sed dolorum eius maiores et.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 17, now(), '4', 'exercitationem voluptatibus quod', 'Aut iure deleniti. Aut dolorem sint rem. Laboriosam qui perspiciatis voluptatibus deserunt et quis eveniet inventore laudantium. Eum deleniti dolor.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 17, now(), '3', 'consequatur aut aut', 'Est architecto et accusantium iure harum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 15, now(), '1', 'laborum fugit fuga', 'Earum numquam numquam. Sit et et. Illum iure delectus debitis quos quis quae voluptas quos sunt. Esse non optio quod.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 16, now(), '2', 'ut fugit eum', 'Earum vero vel modi quos fugiat porro.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 12, now(), '3', 'fuga et nulla', 'Ut voluptatem laudantium at id nulla. Illum dolorum sit. Earum est non temporibus qui voluptatem ipsa itaque eum ut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 19, now(), '5', 'ad est nam', 'Animi molestias saepe modi doloribus dolores possimus. Alias possimus quo voluptatum iste voluptate. Minus non ea necessitatibus qui qui corrupti. Qui id dolores natus sit sed.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 9, now(), '4', 'suscipit autem nemo', 'Perspiciatis odit officiis. Et officiis mollitia laboriosam neque esse.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 3, now(), '0', 'sit unde aliquam', 'Enim expedita deleniti voluptatem beatae soluta quia. Et sequi voluptatem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 16, now(), '2', 'ut a tempore', 'Dolor repellat adipisci.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 14, now(), '0', 'mollitia laborum quasi', 'Nesciunt reprehenderit maxime sed. Voluptatem at corporis voluptatem quasi facere iste et.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 15, now(), '2', 'architecto asperiores quod', 'Facilis iste et est ut rerum aliquam. Illum molestiae at impedit occaecati laboriosam cum soluta laboriosam nihil. Temporibus corporis nihil eos deserunt. Ex voluptatem consequatur fugiat minima est.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 17, now(), '1', 'quis corporis eligendi', 'Et dolores dolores amet consequatur vel. Aliquid excepturi aspernatur nihil est maiores perferendis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 19, now(), '4', 'quo dolor voluptatem', 'Est autem reprehenderit et possimus eum fugit dolores.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 13, now(), '2', 'facere voluptatem pariatur', 'Sed et cum. Distinctio esse maxime voluptatem et eveniet et fugiat laborum nihil.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 13, now(), '1', 'expedita sunt fugiat', 'Repudiandae cumque accusamus et. Magni accusamus omnis est. Magnam consequuntur porro amet aut. Ab qui autem quia dolorum beatae porro.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 10, now(), '3', 'dicta quibusdam sequi', 'Quibusdam vero corporis sapiente vero dolorum et iste in aut. Saepe quia aut et sed assumenda minima vel. Voluptatem numquam animi corrupti modi exercitationem. Corporis nostrum eum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 4, now(), '4', 'vitae provident et', 'Consequatur soluta illo repellat nostrum voluptatem fugiat. Voluptates repudiandae eum. Reprehenderit et numquam ut nihil.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 11, now(), '3', 'ullam placeat laudantium', 'Maxime et velit eum vero commodi. Officia iste minima ea sint.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 5, now(), '1', 'possimus ut iste', 'Qui et provident earum dolorem quae aliquam qui. Nemo et molestias aliquam quas est. In similique totam corrupti impedit ab molestiae. Illo maiores et deleniti eaque laudantium perspiciatis ullam.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 16, now(), '2', 'qui laudantium qui', 'Ut et incidunt odit. Id molestiae excepturi accusantium. Delectus magnam corporis in rerum vero necessitatibus aliquam quo quas.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 5, now(), '0', 'recusandae expedita at', 'Illo dolores voluptatem soluta.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 12, now(), '5', 'est atque minima', 'Nobis ut reprehenderit rerum nesciunt dolorum ab culpa provident corporis. Eum quaerat ut tempore error vitae voluptas.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 17, now(), '4', 'qui adipisci perferendis', 'Molestiae qui optio ut. Dolorem nesciunt blanditiis dolorum ipsum iure maxime quod asperiores.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 13, now(), '3', 'et aut rem', 'Voluptas sapiente nemo dolor esse rem laborum adipisci mollitia placeat. Error minus sint sequi cupiditate animi. Deserunt quia veritatis facere inventore ut velit. Aut aut tenetur consequatur eius.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 8, now(), '3', 'nostrum est id', 'Perspiciatis et iure ullam debitis ipsa quia eveniet nulla quas. Sed id autem voluptatibus consectetur facilis soluta. Sint sequi ut hic aut asperiores vitae voluptatem fuga laudantium. Numquam voluptatem rerum ullam.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 9, now(), '2', 'iure quod fugiat', 'Aut perspiciatis quia. Ea est recusandae numquam. Eveniet velit nulla libero ipsam voluptatem neque consequatur. Sit quo necessitatibus est possimus sit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 16, now(), '5', 'vel delectus et', 'Inventore qui nemo et quis aut omnis ut voluptas blanditiis. Aut distinctio distinctio perferendis enim animi quis quia deleniti ut. Enim quia quas harum voluptatem. Architecto voluptatem impedit laudantium itaque natus voluptates doloremque iure sit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 15, now(), '4', 'voluptates eum consequatur', 'Qui illum sapiente quo quibusdam est qui et voluptatem. Ex eos veniam deleniti laudantium provident quis. Quas voluptas consequatur nisi eos labore similique ipsa. Quae est illum quod.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 9, now(), '5', 'voluptatem soluta voluptate', 'Incidunt et sunt ut et asperiores accusamus sint aut officiis. Consequatur est laudantium ex et impedit omnis. Delectus consequuntur minus exercitationem et qui. Optio quaerat nihil doloremque eaque consequatur dicta excepturi impedit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 17, now(), '5', 'beatae qui repellat', 'Ut laudantium nulla fugit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 13, now(), '0', 'et placeat omnis', 'Veniam molestias numquam. Cupiditate beatae iusto quaerat recusandae laudantium sunt incidunt qui consequatur. Tempore ea debitis doloremque natus qui.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 1, now(), '4', 'commodi maiores maxime', 'Aut quo voluptas minus aut est qui cum ipsum illum. Facere et excepturi neque nulla aut hic et porro qui. Doloribus soluta qui mollitia optio voluptatum accusantium ipsam modi. Atque asperiores et accusamus placeat sed illo quas blanditiis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 9, now(), '5', 'quos voluptatem nihil', 'Libero perferendis cupiditate sed molestiae eligendi. Neque consequatur maxime nam. Saepe accusamus a ipsum non. Rerum voluptas id.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 4, now(), '1', 'sapiente fugit eum', 'Rerum ut autem quisquam. Et quia animi fuga nihil totam qui. Alias et repellendus eos illo aut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 2, now(), '5', 'excepturi sed numquam', 'Dignissimos aliquid harum itaque sed. Nihil consequuntur illum neque earum aut dicta deleniti. Quasi et debitis error quasi aliquam.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 17, now(), '4', 'doloremque sed voluptatem', 'Doloremque accusantium officia non voluptas fugit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 2, now(), '2', 'qui iste illo', 'Esse facilis ut est quaerat quaerat eum temporibus eius. Rerum aut veritatis autem. Deleniti vero eum molestias. Vel natus voluptatum sed quia qui omnis natus velit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 12, now(), '4', 'quia culpa cum', 'Eveniet sint doloribus aut maxime molestiae consequatur quo. Non ad nemo nulla aut deserunt et tempora. Eaque sunt quos eveniet repellendus in laudantium. Est maxime neque perspiciatis magni debitis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 11, now(), '1', 'vero sint debitis', 'Temporibus porro magnam iusto aut optio. Cumque alias culpa. Ducimus veniam aliquid.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 9, now(), '4', 'nulla quaerat voluptatem', 'Sed alias dolor ad quae assumenda voluptates consequatur tenetur. Velit fugiat tempore soluta est eius explicabo expedita. Voluptas vero quas magnam sit doloremque aut excepturi voluptates. Incidunt dolor quam blanditiis similique sit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 13, now(), '1', 'et neque odio', 'Doloremque impedit laboriosam voluptas. Repellendus assumenda molestiae voluptatem earum. Qui cum minima quis dolorum assumenda laboriosam unde nostrum. Iusto odit et.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 19, now(), '3', 'error suscipit amet', 'Aut corporis pariatur. Culpa dolor delectus suscipit voluptatem ipsam explicabo et dolor. Molestiae eveniet minus aspernatur quasi. Inventore dolorum et at repudiandae.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 12, now(), '4', 'adipisci libero voluptas', 'Quibusdam rerum itaque harum. Fugiat autem et corrupti pariatur aut. Facere optio accusantium dolores.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 11, now(), '1', 'in suscipit consequatur', 'Et totam ut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 18, now(), '0', 'quos quisquam atque', 'Et ut voluptas ratione reprehenderit enim omnis sunt quaerat. Omnis nihil commodi quidem molestias.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 9, now(), '0', 'voluptatem aperiam nihil', 'Rerum exercitationem ut qui. Reiciendis est dicta nisi nisi odio quisquam ipsum fuga. Est error dolorem est dolorem iste.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 19, now(), '2', 'ut nostrum ducimus', 'Eaque est aliquam officia aut voluptatibus. Voluptas consectetur aliquam ad ut aut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 2, now(), '3', 'quas voluptatem vero', 'Alias perspiciatis tenetur ut sequi iure ut qui eum. Nesciunt numquam provident tempore blanditiis. Consequatur velit dolor sint debitis neque dolorem ducimus.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 5, now(), '0', 'laborum odit iusto', 'Corrupti maxime eos. Sit suscipit non sequi mollitia totam laboriosam quaerat. Officiis minima adipisci soluta quia aut quibusdam voluptatem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 1, now(), '2', 'dolores fugit voluptatem', 'Voluptates sit eius maiores.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 14, now(), '3', 'amet voluptatem aliquid', 'Earum nesciunt voluptatum magnam. Dolor velit non et dicta repellendus minus voluptatem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 11, now(), '0', 'accusantium dicta ex', 'Cumque velit libero et. Ut pariatur in recusandae non est id. Non eum culpa porro explicabo. Iste aut sed odit id ipsam quia vel.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 14, now(), '1', 'non non id', 'Magnam delectus adipisci libero et non veniam. Cupiditate sint est consequatur et. Quia enim ut impedit dolorum. At numquam tempore eaque maxime laboriosam doloribus vero.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 11, now(), '4', 'numquam eius placeat', 'Quidem voluptatibus repellat repudiandae quos velit. Et accusantium laudantium incidunt perspiciatis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 6, now(), '4', 'ratione quis sed', 'Qui inventore necessitatibus quis. Ea ut est est fugiat eligendi vel.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 4, now(), '4', 'tenetur quis iure', 'Rerum sit et qui vel natus voluptates est quo. Itaque laudantium et eum commodi dolor sint. Eligendi necessitatibus repellendus facere. Voluptas nulla et numquam asperiores nulla adipisci neque et voluptatem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 5, now(), '5', 'necessitatibus fuga minima', 'Velit vel qui non voluptate suscipit saepe illum. Consectetur at dolore rerum et asperiores necessitatibus ut. Delectus assumenda exercitationem harum sed cupiditate repudiandae perferendis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 9, now(), '0', 'velit tempore animi', 'Dolor provident et voluptatem nemo. Eius sint ducimus harum ab. Qui sit est rerum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 7, now(), '3', 'sed facilis molestiae', 'Quod molestias minus qui necessitatibus numquam at sequi.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 9, now(), '5', 'sunt quos dolore', 'Molestiae laborum nobis. Aut tempore praesentium saepe reprehenderit. Amet impedit adipisci voluptatem officiis voluptatem at voluptatem. Ipsum illum animi soluta repellendus placeat accusantium.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 1, now(), '1', 'molestiae animi velit', 'Hic atque voluptatum in est voluptatem qui voluptas labore. Sit ad quasi et suscipit doloremque quisquam perferendis. Suscipit accusantium labore. Cupiditate laudantium vitae cupiditate.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 1, now(), '4', 'vitae molestiae quam', 'Omnis iure cum. Laborum eligendi molestiae et sapiente quis dolorem illum assumenda qui.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 4, now(), '3', 'similique consequuntur optio', 'Voluptates molestiae doloribus officia ut odio illum asperiores laboriosam iusto. Dolor velit vel dignissimos natus enim dolor accusantium magni sit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 2, now(), '2', 'dicta perferendis facere', 'Sequi maiores et et tempore consequatur. Veniam facere consectetur voluptas est illo sed impedit libero. Repudiandae commodi dolorem magni. Rerum rerum neque quae officiis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 9, now(), '2', 'laborum provident voluptatibus', 'Ut ipsa dolorum qui. Suscipit et voluptates eos illum rerum minima repellat. Voluptatum minima est recusandae sed aut. Reiciendis ut quia iusto eaque.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 9, now(), '5', 'esse magnam id', 'Sit dolorem consequatur qui doloremque eos cumque.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 2, now(), '3', 'eius omnis atque', 'Voluptatem voluptatum aperiam omnis cum sit id occaecati qui delectus. Error optio nihil ut dolor sapiente eos doloribus. Tenetur aut explicabo facere inventore porro eum nostrum voluptate consectetur.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 16, now(), '4', 'eaque at non', 'Minima porro facilis in non est perspiciatis. Aut earum a fugiat eos.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 14, now(), '4', 'aliquid nostrum est', 'Laborum animi tempora ea odit explicabo et. Dolorum aut voluptas ad animi. Et doloremque vitae et ab velit. Asperiores sapiente non error enim sunt vitae aut qui officia.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 14, now(), '4', 'sed ullam dolorem', 'Porro earum et voluptatem doloremque quam quia. Animi laboriosam est accusamus ea. Voluptate dolore dolores iure. Dignissimos minus consequatur dolorem enim et consequatur.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 6, now(), '4', 'exercitationem ullam nulla', 'Qui nostrum quia voluptate nulla dignissimos quo saepe dolores. Quidem dignissimos maxime exercitationem voluptates libero.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 10, now(), '2', 'cum dicta repudiandae', 'Est dolores blanditiis qui doloremque asperiores at voluptates. Nemo totam nisi rem veniam enim hic sapiente. Accusamus enim quo maiores est dolor et provident. Esse eveniet consequatur quisquam magni quisquam veritatis iste quibusdam nemo.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 19, now(), '0', 'similique vel maiores', 'Voluptatem itaque deleniti. Eligendi suscipit adipisci laboriosam omnis ut ut. Assumenda amet harum voluptatem praesentium illo doloribus eos odit ea. Ipsum qui molestiae expedita delectus eos sit corporis eveniet voluptatem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 5, now(), '2', 'repudiandae ducimus natus', 'Omnis sit ut in. Repellat harum eos ut. Sapiente voluptatem voluptatem voluptatibus cum molestiae et et non quisquam. Ut neque autem necessitatibus pariatur labore.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 8, now(), '3', 'temporibus veniam inventore', 'Magnam quaerat quos sint occaecati quis dolorem excepturi rerum. Ullam nam ut sequi adipisci minima sit inventore hic architecto. Enim aspernatur eius autem nobis voluptas vitae corporis. Consequatur saepe est voluptatem quia.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 1, now(), '5', 'voluptate excepturi ab', 'Quis molestiae qui deserunt error neque explicabo voluptatem. Occaecati praesentium nobis impedit aut corporis qui natus.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 12, now(), '2', 'ipsum perferendis odit', 'Facere rerum facilis voluptates.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 16, now(), '5', 'voluptatem repudiandae et', 'Ut mollitia incidunt exercitationem. Libero qui vero.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 14, now(), '3', 'officiis quis et', 'Cupiditate harum iure voluptatem architecto est alias. Dolor excepturi corporis repudiandae nisi dicta quae dolorem sit deserunt. Vel commodi a culpa.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 8, now(), '4', 'fugit est recusandae', 'Impedit corrupti consequatur quod sint illo.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 18, now(), '5', 'itaque ab consequatur', 'Molestiae laboriosam est ducimus voluptatem ut molestiae asperiores et. Consectetur et et expedita dicta unde non veniam unde.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 8, now(), '2', 'est ut accusamus', 'Vitae pariatur est voluptatem beatae dignissimos odit voluptas.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 19, now(), '4', 'occaecati voluptas quas', 'Voluptate in placeat dolorem temporibus.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 12, now(), '1', 'tenetur eveniet quaerat', 'Non accusantium architecto laudantium dolorem ut sapiente eaque quis aut. Sed aut aliquam est dolores nostrum sit doloremque non ut. Quia blanditiis perspiciatis aliquid voluptatem enim ut. Saepe tenetur alias animi fugiat voluptatem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 3, now(), '0', 'voluptate dolorem fugit', 'Reiciendis sed suscipit corrupti rerum quo impedit quo.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 13, now(), '4', 'expedita officiis illo', 'Doloremque aut reprehenderit facere. Esse officia nihil. Enim velit natus et magnam rerum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 7, now(), '5', 'quo et reprehenderit', 'Velit quia maiores aperiam quia libero voluptas voluptate. Laudantium voluptatem qui rerum sapiente ut dolorum atque labore. Commodi voluptatibus adipisci omnis et molestias officiis aspernatur voluptates itaque. Eos laboriosam doloremque amet ut esse similique ut perspiciatis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 6, now(), '0', 'ad qui assumenda', 'Eum iusto explicabo quae.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 10, now(), '5', 'delectus explicabo suscipit', 'Omnis suscipit numquam autem. Repudiandae quo repellat quis sed nulla quis inventore id.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 4, now(), '4', 'assumenda quo unde', 'Hic dicta velit quis maiores quo reprehenderit dolorem aut. Cum sint eos qui esse blanditiis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 11, now(), '4', 'quo est autem', 'Nisi voluptatem blanditiis et qui harum necessitatibus dolores.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 17, now(), '2', 'adipisci in aut', 'Vel doloribus reiciendis dolores enim expedita. Ut asperiores quis doloribus enim.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 5, now(), '0', 'minus ratione adipisci', 'Inventore fugit molestiae fuga molestiae deserunt est itaque provident id. Culpa ea quas velit enim ad sunt qui enim voluptas.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 2, now(), '4', 'magni totam nemo', 'Vitae nesciunt velit quo laboriosam fugit dicta laudantium sapiente repellat.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 9, now(), '4', 'ut quos voluptas', 'Cum voluptas et sapiente aut hic assumenda voluptas omnis labore.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 2, now(), '0', 'nobis sit omnis', 'Ut similique animi voluptas eaque qui dolor ipsum. Sit dolorum sint delectus nam veritatis veniam. Mollitia qui tenetur omnis ut et et nostrum et pariatur. Voluptate non esse a.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 1, now(), '0', 'eius quis voluptatem', 'Animi nisi sit esse dicta fuga libero ut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 15, now(), '5', 'qui deleniti ea', 'Amet molestiae beatae. Rerum quisquam alias consequatur corporis voluptatem quisquam qui occaecati.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 15, now(), '5', 'perspiciatis magnam ut', 'Sed sint laboriosam ea ut rerum aut ad explicabo. Cupiditate ducimus ut consequatur in eaque. Tempore officiis repudiandae aut ea odio. Dolorem quo aliquam et asperiores amet ea magnam et illo.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 14, now(), '4', 'quia saepe asperiores', 'Sit impedit quod aut totam ipsum nulla quasi ratione sit. Architecto quisquam labore officiis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 2, now(), '0', 'et sit in', 'Vero provident quis id debitis ea a id. Ab omnis nihil.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 10, now(), '3', 'nam id ad', 'Debitis et aspernatur.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 14, now(), '5', 'inventore et omnis', 'Dolores ex ullam mollitia magnam repudiandae voluptatem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 13, now(), '3', 'aut quod adipisci', 'Et repellat est. Maiores sunt magnam molestiae deserunt saepe occaecati et voluptatum qui.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 1, now(), '5', 'cumque quam dignissimos', 'Ut suscipit quo. Quae sit neque voluptatem. Numquam quam consequatur voluptatem repellat. Velit voluptas autem laboriosam nam vel.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 1, now(), '2', 'tenetur occaecati veritatis', 'Vel modi tempora quia ut expedita tempore sed enim fugiat. Voluptate excepturi aut molestiae.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 19, now(), '1', 'qui cum omnis', 'Et ut assumenda aut ut. Qui sequi sequi ut ipsum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 6, now(), '3', 'ratione incidunt ratione', 'Qui praesentium debitis laborum. Fuga expedita quod accusantium commodi odio fuga et.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 4, now(), '4', 'dolorum laudantium libero', 'Labore dolores quia.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 9, now(), '1', 'sed similique deserunt', 'Exercitationem perspiciatis ea debitis ad sunt voluptas dignissimos praesentium. Id impedit facilis et. Saepe excepturi incidunt qui quis dignissimos et. Asperiores eligendi totam ut ea ut quidem.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 18, now(), '1', 'tenetur tenetur quam', 'Esse dolorum in sapiente.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 5, now(), '4', 'eveniet commodi in', 'Occaecati ut molestiae omnis consequuntur placeat est voluptatem. Adipisci deserunt ut beatae sit iste quo pariatur. Similique maxime facilis molestiae nihil tempore eaque et alias.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 9, now(), '4', 'et nihil qui', 'Quod facilis fugit laborum sed soluta eaque voluptatem unde cumque. Expedita nostrum exercitationem nemo sunt vitae. Voluptate vitae sit quia quas adipisci dolor sequi tempora et.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 14, now(), '0', 'reprehenderit quas enim', 'Tempore quia omnis aut et quia et minus sequi ad.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 6, now(), '0', 'harum quo ut', 'Totam nihil vel voluptas est est soluta ut in.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 2, now(), '5', 'provident mollitia nulla', 'Quos dignissimos dignissimos. Vero harum iure non aliquid quia veniam et aut fuga. Quam sunt et modi unde accusamus deserunt.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 15, now(), '3', 'inventore nihil voluptates', 'Quas reiciendis corporis corporis natus delectus. Eligendi dolor et sed ipsum aut quo.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 2, now(), '0', 'tempora eligendi ea', 'Eum modi sed qui voluptatibus autem qui placeat.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 1, now(), '4', 'accusantium ea id', 'Facere reprehenderit reprehenderit quam possimus. Animi quod omnis tempora laudantium quidem cum itaque.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 19, now(), '1', 'praesentium unde quam', 'Dolor quidem incidunt est porro pariatur itaque.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 14, now(), '4', 'quos qui accusantium', 'Facilis aliquid est doloremque alias eum. Quaerat consequuntur asperiores. Dolor a labore et libero.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 11, now(), '0', 'est sit quod', 'Mollitia fugiat quam et praesentium quasi aut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 15, now(), '4', 'temporibus aut odio', 'Quia enim dolorum sed quas numquam totam laboriosam mollitia iste. Quod sit quas similique incidunt corrupti aut maiores in.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 15, now(), '5', 'maiores sed sapiente', 'Recusandae velit sed eum temporibus occaecati maiores autem quo accusamus. Iste qui dolore recusandae commodi dolorem sed voluptatem. Debitis pariatur veniam commodi quidem doloribus aut iusto.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 8, now(), '3', 'et unde esse', 'Fugiat ratione culpa explicabo. Eum quia quisquam repellendus tempora natus et praesentium culpa.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 19, now(), '5', 'nemo necessitatibus nihil', 'Dolore necessitatibus ea commodi et hic. In tempore perferendis ut quae. Velit aut quisquam porro autem itaque reiciendis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 6, now(), '0', 'doloribus officia modi', 'Sit quis quia velit magni.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 19, now(), '5', 'voluptas eum sit', 'Aut quis ratione nemo nesciunt nisi aut. Doloribus voluptas quia molestiae numquam nulla. Aliquid velit aliquid ut optio consequuntur commodi qui iusto.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 19, now(), '2', 'accusantium voluptas ea', 'Quia reprehenderit et consequatur qui aut ipsam corrupti.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 17, now(), '3', 'quasi quasi sit', 'Facilis id omnis et nostrum voluptatem velit tempore. Est et dicta explicabo ea non perspiciatis eum. Veniam eligendi rerum ea.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 8, now(), '3', 'sint inventore laborum', 'Sapiente aut magnam quibusdam nisi ut odit et quibusdam. Atque atque quia atque cum inventore dolorem eum non reiciendis. Nobis consectetur fuga sit ut eum quia optio ratione.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 4, now(), '2', 'et itaque molestias', 'Iure dolores dolore quidem veritatis ut sit consequatur laborum veritatis. Repudiandae a enim cumque cupiditate.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 18, now(), '5', 'et a inventore', 'Reprehenderit corporis qui asperiores tenetur mollitia et quam.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 15, now(), '0', 'officiis modi a', 'Illum ea totam quis sapiente et inventore aut. Est deleniti blanditiis sit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 14, now(), '5', 'possimus aut temporibus', 'Id quia quos velit aliquam eos id. Sunt quaerat fugiat amet ipsam quasi nisi hic velit. Aut iste quo rerum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 15, now(), '1', 'dolore totam odit', 'Unde natus voluptas accusantium alias esse. Aut laboriosam omnis omnis. Assumenda quidem totam ad et occaecati sapiente eos.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 4, now(), '3', 'repudiandae harum tempora', 'Soluta non cum culpa. Aut et alias et totam distinctio ipsum et velit nisi.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (5, 6, now(), '3', 'eius id repellendus', 'Vel consequuntur saepe porro. Architecto cumque dignissimos. Non ut delectus aut.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 7, now(), '2', 'et esse eum', 'Veritatis nulla sit et quidem laboriosam doloribus molestiae et sit. Atque vel quasi qui officia fugiat suscipit. Eaque ullam rerum quidem vel qui veniam eos accusamus accusantium.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 4, now(), '1', 'itaque qui vitae', 'Possimus facilis ut quo necessitatibus aspernatur facilis.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 14, now(), '1', 'id rerum ullam', 'Aut mollitia aliquam ullam et. Eius dolores enim non natus magnam magnam molestiae est iure. Velit molestiae eligendi perferendis velit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 1, now(), '0', 'et sed vero', 'Ratione ipsam consequatur doloribus quia quod pariatur animi debitis occaecati. Dignissimos itaque soluta ipsum expedita.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 17, now(), '5', 'tempore aut autem', 'Culpa quidem atque odit et qui quis sit quasi.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (8, 15, now(), '5', 'excepturi eius molestiae', 'Quia optio eos incidunt fugiat. Laborum qui laboriosam possimus eveniet consequuntur delectus eaque sapiente. Quia corrupti illo maxime minima debitis quia et fugiat.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 7, now(), '1', 'dolor sed odio', 'Magni provident impedit commodi. Dolores veritatis eaque voluptatem. Adipisci blanditiis porro est omnis doloribus.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 1, now(), '4', 'sunt consequuntur animi', 'Eum voluptatem nihil optio et eius voluptate mollitia. Ipsam rem dolor itaque sunt sit ad excepturi delectus. Nisi corporis voluptates ut quia excepturi enim dicta. Fuga nobis et accusantium voluptatem sed officiis atque dolorum molestiae.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (1, 8, now(), '2', 'tempora deleniti voluptatem', 'Minus ut voluptatem est fugit tempora. Et aut voluptates voluptas. Magnam dolorem vel enim a qui.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (9, 17, now(), '2', 'accusantium sequi amet', 'Autem incidunt quo cumque labore impedit omnis eum commodi quod. Ad eius sed aliquid optio. Voluptatem sapiente et consequatur perferendis nobis velit ipsa rerum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (2, 2, now(), '5', 'voluptas ratione ut', 'Maiores maxime corrupti et. Officia voluptatem qui velit ea ex doloribus. Deleniti aut ad laborum aperiam porro est explicabo modi sunt.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 12, now(), '3', 'et ut voluptatem', 'Qui nisi maiores. Autem sunt voluptas molestiae nihil.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (7, 13, now(), '2', 'eos assumenda est', 'Minima excepturi quibusdam voluptate illum repellendus. Ea quia sit aut quo. Iusto deserunt non. Inventore sit ea autem fugit est reprehenderit delectus dignissimos et.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (6, 18, now(), '1', 'rerum magni dignissimos', 'Molestiae cumque ipsum sed ipsa autem optio omnis ad. Cumque saepe quo commodi cupiditate beatae quidem. Ut optio qui et ullam totam. Voluptate doloremque fuga libero ex.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 19, now(), '2', 'debitis rerum recusandae', 'Incidunt deserunt nostrum enim voluptatem eaque voluptas vero nostrum. Sit illum fugiat sit. Dolore id asperiores animi soluta et. Sint blanditiis sunt sit ratione occaecati quaerat.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 19, now(), '2', 'sit voluptas sed', 'Nisi aut ad ullam sed similique hic vel suscipit.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 19, now(), '0', 'sed rerum sint', 'Ut aut et eligendi ut autem beatae qui laboriosam. Cum provident iure optio voluptatem quis voluptatem. Nemo molestiae est maxime. Cumque blanditiis rem vero accusamus possimus quaerat sunt rerum.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (4, 6, now(), '3', 'aut ratione fuga', 'Labore corporis animi eum nisi ipsa dolore laboriosam delectus. Architecto itaque magni ea suscipit sequi sint dolores sunt. Cumque quaerat iusto dolor excepturi. Molestiae ea sed.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (3, 2, now(), '2', 'atque officia quo', 'Inventore eaque perferendis laborum iusto.');
INSERT INTO review
  (client_id, product_id, review_date, stars, title, comment)
VALUES
  (10, 12, now(), '1', 'quidem deserunt velit', 'Neque hic eligendi ut. Natus necessitatibus distinctio dolor unde exercitationem.');
