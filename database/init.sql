CREATE TABLE tarjetas (
  id             SERIAL PRIMARY KEY,
  numero_tarjeta VARCHAR(20) NOT NULL UNIQUE,
  cvv            VARCHAR(4),
  nombre_cliente VARCHAR(120)
);

INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente)
VALUES ('5111111111111111', '321', 'Cliente Prueba Mastercard');

INSERT INTO tarjetas (numero_tarjeta, cvv, nombre_cliente)
VALUES ('5222222222222222', '654', 'Cliente Mastercard Secundario');