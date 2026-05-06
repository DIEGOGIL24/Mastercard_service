CREATE TABLE tarjetas (
  id             SERIAL PRIMARY KEY,
  numero_tarjeta VARCHAR(20) NOT NULL UNIQUE,
  cvv            VARCHAR(4),
  nombre_cliente VARCHAR(120)
);

-- Tarjetas para pruebas rapidas
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5000000000000000', '123', 'Carlos Mendoza Ruiz');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5111111111111111', '321', 'Ana Maria Delgado');

INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5532150089224410', '823', 'Carlos Mendoza Ruiz');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5012883455610092', '145', 'Ana Maria Delgado');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5242424242424242', '991', 'Usuario Pruebas Platino');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5716209934115088', '332', 'Roberto Gomez Silva');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5485301122446677', '554', 'Lucia Fernandez Paz');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5929110055883321', '671', 'Esteban Quito Torres');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5100203040506070', '219', 'Marta Sanchez Vega');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5556812233445566', '402', 'Alejandro Sanz Lara');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5800123412341234', '778', 'Sofia Ramirez Ortiz');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5315998877665544', '112', 'Diego Armando Forlan');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5658210033994455', '883', 'Beatriz Aurora Pinzon');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5213556600221144', '560', 'Ricardo Jorge Lopez');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5417102030405060', '394', 'Elena Gallegos Muro');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5916885522110033', '227', 'Fernando Alonso Diaz');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5539771122334455', '601', 'Gabriela Mistral Reyes');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5788334411220099', '443', 'Hugo Sanchez Marquez');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5024115599228833', '908', 'Isabel Allende Llona');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5121003366992211', '156', 'Javier Sotomayor San');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5455882233110044', '721', 'Karla Wheelock Aguayo');
INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente) VALUES ('5610223344556677', '289', 'Luis Miguel Gallego');