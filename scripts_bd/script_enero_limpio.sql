START TRANSACTION;


-- Cliente: Sebastian Castillo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72041694.0', 'Sebastian Castillo', '2025-12-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72041694.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-17 00:00:00', 250.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 250.0, 'YAPE JL', '2025-12-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 250.0, 1, 250.0);

-- Cliente: Daniel Rojas Salas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('75931158.0', 'Daniel Rojas Salas', '2025-12-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '75931158.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-20 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2025-12-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Miriam Salas Guevara
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('25631173.0', 'Miriam Salas Guevara', '2025-12-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '25631173.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-20 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2025-12-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Juan Carlos Vidal Molina
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('75728889.0', 'Juan Carlos Vidal Molina', '2025-11-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '75728889.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-11-09 00:00:00', 220.0, 110.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 110.0, 'YAPE JL', '2025-11-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 220.0, 1, 220.0);

-- Cliente: CESAR KENNY YACARINI PEREYRA
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44000113.0', 'CESAR KENNY YACARINI PEREYRA', '2025-12-26 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44000113.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-26 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'PLIN JL', '2025-12-26 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Ronald elvis quispe gil
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43619681.0', 'Ronald elvis quispe gil', '2025-12-26 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43619681.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-26 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'PLIN JL', '2025-12-26 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Flor de maria Guevara
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43943113.0', 'Flor de maria Guevara', '2025-12-26 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43943113.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-26 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'PLIN JL', '2025-12-26 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Franco Nieto Ponce
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Franco Nieto Ponce', '2025-12-29 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-29 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Luis Enrique Nieto Arauco
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Luis Enrique Nieto Arauco', '2025-12-29 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-29 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Gladys Montes
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Gladys Montes', '2025-12-29 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-29 00:00:00', 175.0, 125.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 175.0, 1, 175.0);

-- Cliente: Fernando Alfredo Auqui Cerron
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Fernando Alfredo Auqui Cerron', '2025-12-29 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-29 00:00:00', 175.0, 125.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 175.0, 1, 175.0);

-- Cliente: Gianfranco Auqui Guerrero
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Gianfranco Auqui Guerrero', '2025-12-29 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-29 00:00:00', 175.0, 125.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 175.0, 1, 175.0);

-- Cliente: Germán Auqui Cerrón
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Germán Auqui Cerrón', '2025-12-29 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-29 00:00:00', 175.0, 125.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 175.0, 1, 175.0);

-- Cliente: Rafael Antony Urbina Peña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('49035262.0', 'Rafael Antony Urbina Peña', '2025-12-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '49035262.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-30 00:00:00', 350.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 350.0, 'YAPE JL', '2025-12-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 350.0, 1, 350.0);

-- Cliente: Roberto Benites Aguilar
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71486933.0', 'Roberto Benites Aguilar', '2025-12-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71486933.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-31 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2025-12-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 220.0, 1, 220.0);

-- Cliente: Ernesto De La Cruz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46910475.0', 'Ernesto De La Cruz', '2025-12-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46910475.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-31 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2025-12-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Hugo De La Cruz
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Hugo De La Cruz', '2025-12-31 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-31 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2025-12-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 100.0, 1, 100.0);

-- Cliente: Antonio Lora
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40677695.0', 'Antonio Lora', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40677695.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Luis Lora Reyes
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('8553072.0', 'Luis Lora Reyes', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '8553072.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Rosa Juana Mogrovejo Sihue
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44041233.0', 'Rosa Juana Mogrovejo Sihue', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44041233.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-02 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Hernán Vidal Ulloa
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('9312996.0', 'Hernán Vidal Ulloa', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '9312996.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-03 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Gustavo Enrique Benites Aguilar
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71460870.0', 'Gustavo Enrique Benites Aguilar', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71460870.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 220.0, 1, 220.0);

-- Cliente: Jose Gabriel Janampa Osores
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42296972.0', 'Jose Gabriel Janampa Osores', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42296972.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Deessiree Menendez ortiz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47162607.0', 'Deessiree Menendez ortiz', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47162607.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 334.4, 167.2, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 167.2, 'MERC-PAG', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 334.4, 1, 334.4);

-- Cliente: Arnaldo Guardamino cavezas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41397674.0', 'Arnaldo Guardamino cavezas', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41397674.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 334.4, 167.2, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 167.2, 'MERC-PAG', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 334.4, 1, 334.4);

-- Cliente: Daniel Ricardo moran Chávez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72413600.0', 'Daniel Ricardo moran Chávez', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72413600.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Frank Alonso Bautista Cucho
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Frank Alonso Bautista Cucho', '2026-01-02 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Aaron Castillo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71523029.0', 'Aaron Castillo', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71523029.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Sergio Armando Lopez Saldaña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40697850.0', 'Sergio Armando Lopez Saldaña', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40697850.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: José pineda sifuentes
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('7524459.0', 'José pineda sifuentes', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '7524459.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 175.0, 1, 175.0);

-- Cliente: Ana Paula Pineda
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Ana Paula Pineda', '2026-01-02 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 100.0, 1, 100.0);

-- Cliente: Luis Esteban Ramos Nicoll
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42048172.0', 'Luis Esteban Ramos Nicoll', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42048172.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BCP JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 180.0, 1, 180.0);

-- Cliente: Herbert Ricardo Arroyo Vilchez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('32992113.0', 'Herbert Ricardo Arroyo Vilchez', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '32992113.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'PLIN JL', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Ruth Goyzueta Valencia
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('16683079.0', 'Ruth Goyzueta Valencia', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '16683079.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-03 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: Isabel Cecilia granza toro
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10116845.0', 'Isabel Cecilia granza toro', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10116845.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'BCP EPP', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 220.0, 1, 220.0);

-- Cliente: Ana Isabel Tello granza
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Ana Isabel Tello granza', '2026-01-03 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'BCP EPP', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 220.0, 1, 220.0);

-- Cliente: FRANCIS GARCÍA ARISTA
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('FRANCIS GARCÍA ARISTA', '2026-12-28 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-12-28 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-12-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 190.0, 1, 190.0);

-- Cliente: ROLANDO
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('ROLANDO', '2026-01-10 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-10 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-10 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 1, 0.0, 1, 0.0);

-- Cliente: Anthony Molina Heredia
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47078798', 'Anthony Molina Heredia', '2025-12-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47078798' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-02 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2025-12-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 220.0, 1, 220.0);

-- Cliente: Rodrigo Bustamante Moquillaza
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44681923', 'Rodrigo Bustamante Moquillaza', '2025-12-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44681923' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-17 00:00:00', 355.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2025-12-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 355.0, 1, 355.0);

-- Cliente: Philip Wenter Bustamante
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Philip Wenter Bustamante', '2025-12-17 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-17 00:00:00', 355.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2025-12-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 355.0, 1, 355.0);

-- Cliente: Sebastian Matias Prada Fernandez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72495808', 'Sebastian Matias Prada Fernandez', '2025-12-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72495808' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-17 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2025-12-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Jorge Fernandez Huaman
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('09594474', 'Jorge Fernandez Huaman', '2025-12-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '09594474' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-17 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2025-12-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);

-- Cliente: Miguel Ángel Requiz Alanís
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44889118', 'Miguel Ángel Requiz Alanís', '2025-12-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44889118' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-23 00:00:00', 360.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 360.0, 'BCP EPP', '2025-12-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 180.0, 1, 180.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 180.0, 1, 180.0);

-- Cliente: Carlos Miguel Olivares Pérez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43045566', 'Carlos Miguel Olivares Pérez', '2025-12-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43045566' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-23 00:00:00', 360.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 360.0, 'YAPE JL', '2025-12-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 180.0, 1, 180.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 180.0, 1, 180.0);

-- Cliente: Aldo Augusto Di liberto Roldán
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Aldo Augusto Di liberto Roldán', '2025-12-20 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-20 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'BCP EPP', '2025-12-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);

-- Cliente: Yames Vicente di liberto Roldán
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Yames Vicente di liberto Roldán', '2025-12-20 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-20 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'BCP EPP', '2025-12-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);

-- Cliente: Enrique Raynor La Torre Alarcón
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72616360', 'Enrique Raynor La Torre Alarcón', '2026-12-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72616360' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-12-30 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'YAPE JL', '2026-12-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Rafael Antony Urbina Peña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('49035262', 'Rafael Antony Urbina Peña', '2025-12-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '49035262' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-30 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2025-12-30 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 0.0, 1, 0.0);

-- Cliente: Pierre Neyra
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('49032421', 'Pierre Neyra', '2025-12-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '49032421' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-30 00:00:00', 181.58, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 181.58, 'MERC-PAG', '2025-12-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 181.58, 1, 181.58);

-- Cliente: Marieta Calderon
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73185937', 'Marieta Calderon', '2025-12-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73185937' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-30 00:00:00', 181.58, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 181.58, 'MERC-PAG', '2025-12-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 181.58, 1, 181.58);

-- Cliente: Sergio Jesús Casas Arroyo
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Sergio Jesús Casas Arroyo', '2025-12-23 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-23 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2025-12-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 220.0, 1, 220.0);

-- Cliente: Jose Gabriel Janampa Osores
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42296972', 'Jose Gabriel Janampa Osores', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42296972' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: kevin alarico cieza
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70945763', 'kevin alarico cieza', '2025-12-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70945763' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-31 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'PLIN JL', '2025-12-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 50.0, 1, 50.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 50.0, 1, 50.0);

-- Cliente: Juan Carlos Bustamante Merino
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47628203', 'Juan Carlos Bustamante Merino', '2025-12-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47628203' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-31 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'PLIN JL', '2025-12-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 50.0, 1, 50.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 50.0, 1, 50.0);

-- Cliente: Daniel Ricardo moran Chávez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72413600', 'Daniel Ricardo moran Chávez', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72413600' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Aaron Castillo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71523029', 'Aaron Castillo', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71523029' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-02 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-02 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 0.0, 1, 0.0);

-- Cliente: Sergio Armando Lopez Saldaña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40697850', 'Sergio Armando Lopez Saldaña', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40697850' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: José pineda sifuentes
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('07524459', 'José pineda sifuentes', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '07524459' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 175.0, 1, 175.0);

-- Cliente: Ana Paula Pineda
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Ana Paula Pineda', '2026-01-02 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 100.0, 1, 100.0);

-- Cliente: Luis Esteban Ramos Nicoll
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42048172', 'Luis Esteban Ramos Nicoll', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42048172' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BCP JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 180.0, 1, 180.0);

-- Cliente: José Martin Quineche Sánchez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('08870972', 'José Martin Quineche Sánchez', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '08870972' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-02 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 200.0, 1, 200.0);

-- Cliente: Deivy wilson rios anco
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45479473', 'Deivy wilson rios anco', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45479473' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 363.16, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 363.16, 'MERC-PAG', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 181.58, 1, 181.58);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 181.58, 1, 181.58);

-- Cliente: David Guardia Menendez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('⁠45526454', 'David Guardia Menendez', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '⁠45526454' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 334.4, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 167.2, 'MERC-PAG', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 334.4, 1, 334.4);

-- Cliente: Lourdes Franco Vidal
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45786136', 'Lourdes Franco Vidal', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45786136' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 334.4, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 167.2, 'MERC-PAG', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 334.4, 1, 334.4);

-- Cliente: Jorge Araujo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45592753', 'Jorge Araujo', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45592753' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-03 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 220.0, 1, 220.0);

-- Cliente: José Ernesto Rodríguez Marcelo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44784709', 'José Ernesto Rodríguez Marcelo', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44784709' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 200.0, 1, 200.0);

-- Cliente: María Quiroga
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('María Quiroga', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Carlos Gil
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Carlos Gil', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Diego Miletich
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Diego Miletich', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Mirko Miletich
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Mirko Miletich', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Manuel Mori Mideyros
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41577290', 'Manuel Mori Mideyros', '2026-01-04 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41577290' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-04 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'PLIN JL', '2026-01-04 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Ambioris Peña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('003012946', 'Ambioris Peña', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '003012946' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-05 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'PLIN JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Walter Castro vargas
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Walter Castro vargas', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 350.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 330.0, 'BCP JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 175.0, 1, 175.0);

-- Cliente: Walter Castro Ugarte
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Walter Castro Ugarte', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 350.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 330.0, 'BCP JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 175.0, 1, 175.0);

-- Cliente: Ivan Irwin Espinoza Revolo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46641938', 'Ivan Irwin Espinoza Revolo', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46641938' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-06 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Guadalupe Ivana Tarazona Velarde
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71089810', 'Guadalupe Ivana Tarazona Velarde', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71089810' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-06 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Carlos Meza Gamero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40262423', 'Carlos Meza Gamero', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40262423' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-07 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: RODOLFO Vladimir Cajahuanca Ydone
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10602143', 'RODOLFO Vladimir Cajahuanca Ydone', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10602143' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 200.0, 1, 200.0);

-- Cliente: Zhituo Wang
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('01216344', 'Zhituo Wang', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '01216344' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'BBVA JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 190.0, 1, 190.0);

-- Cliente: Alvaro Macuri
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74034992', 'Alvaro Macuri', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74034992' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-07 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 220.0, 1, 220.0);

-- Cliente: Miguel Angel Romero quero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43373830', 'Miguel Angel Romero quero', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43373830' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 200.0, 1, 200.0);

-- Cliente: Miguel arellano chunga
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44049748', 'Miguel arellano chunga', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44049748' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-05 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);

-- Cliente: Angel Gonzales Ramos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43855684', 'Angel Gonzales Ramos', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43855684' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-05 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);

-- Cliente: María Fernanda Ushiñahua Meza
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73345092', 'María Fernanda Ushiñahua Meza', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73345092' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 180.0, 1, 180.0);

-- Cliente: Jonathan Donovan Choquehuanca Condori
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44846202', 'Jonathan Donovan Choquehuanca Condori', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44846202' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 180.0, 1, 180.0);

-- Cliente: Juan Edgar Tito Cornejo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41411344', 'Juan Edgar Tito Cornejo', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41411344' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-08 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'BBVA JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);

-- Cliente: Liliana Benito Zurita
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70435293', 'Liliana Benito Zurita', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70435293' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-08 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'BBVA JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 190.0, 1, 190.0);

-- Cliente: Alexander Platero Mamani
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74095604', 'Alexander Platero Mamani', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74095604' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-07 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 220.0, 1, 220.0);

-- Cliente: Mariana Barrera Cravero
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Mariana Barrera Cravero', '2026-01-08 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-08 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 220.0, 1, 220.0);

-- Cliente: Juan Carlos Achiri Ccapa
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43676825', 'Juan Carlos Achiri Ccapa', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43676825' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-08 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 200.0, 1, 200.0);

-- Cliente: Daniel Gómez Muñante
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48605650', 'Daniel Gómez Muñante', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48605650' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-07 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 3, 220.0, 1, 220.0);

-- Cliente: Flor de maria vega zapata
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*07200287', 'Flor de maria vega zapata', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*07200287' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-08 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 220.0, 1, 220.0);

-- Cliente: JOSUE DEL VALLE
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('JOSUE DEL VALLE', '2026-01-11 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 8, '2026-01-11 00:00:00', 360.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-11 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 2, 360.0, 1, 360.0);

-- Cliente: Alan Paul Otiniano Azahuanche
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41864072', 'Alan Paul Otiniano Azahuanche', '2025-12-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41864072' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-23 00:00:00', 220.0, 110.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 110.0, 'YAPE JL', '2025-12-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 220.0, 1, 220.0);

-- Cliente: Walter Peralta
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('09954438', 'Walter Peralta', '2025-12-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '09954438' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-23 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2025-12-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 220.0, 1, 220.0);

-- Cliente: Jonathan Marrou
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46649174', 'Jonathan Marrou', '2025-12-18 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46649174' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-18 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'BCP EPP', '2025-12-18 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Ricardo Marrou
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10303242', 'Ricardo Marrou', '2025-12-18 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10303242' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-18 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'BCP EPP', '2025-12-18 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Ivan Salsavilca Faustino
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44273674', 'Ivan Salsavilca Faustino', '2025-12-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44273674' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-23 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'YAPE JL', '2025-12-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Nicolas Gámez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('77059170', 'Nicolas Gámez', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '77059170' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-02 00:00:00', 380.0, 160.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Manuel Buendia
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42126105', 'Manuel Buendia', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42126105' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-05 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'BCP EPP', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 175.0, 1, 175.0);

-- Cliente: Liselle Prieto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41758472', 'Liselle Prieto', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41758472' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-05 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'BCP EPP', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 175.0, 1, 175.0);

-- Cliente: Sandro León Anfossi
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10734077', 'Sandro León Anfossi', '2025-12-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10734077' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-15 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-15 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 0.0, 1, 0.0);

-- Cliente: Willy rabanal calderon
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41570562', 'Willy rabanal calderon', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41570562' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-06 00:00:00', 380.0, 190.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'BCP JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Bryan Ochoa Salas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48129640', 'Bryan Ochoa Salas', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48129640' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-06 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);

-- Cliente: Néstor Walter Villegas Macedo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70605782', 'Néstor Walter Villegas Macedo', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70605782' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-06 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);

-- Cliente: Carlos Cuadra Macedo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40298292', 'Carlos Cuadra Macedo', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40298292' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-06 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);

-- Cliente: Franco Daniel Delzo Cuyubamba
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70437688', 'Franco Daniel Delzo Cuyubamba', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70437688' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-06 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);

-- Cliente: Pilar coveñas Ramos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46123466', 'Pilar coveñas Ramos', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46123466' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-05 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2026-01-05 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 0.0, 1, 0.0);

-- Cliente: carlos ore yufre
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46063723', 'carlos ore yufre', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46063723' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-08 00:00:00', 380.0, 190.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 380.0, 1, 380.0);

-- Cliente: Jesús Amir Huaccho Hidalgo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73563073', 'Jesús Amir Huaccho Hidalgo', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73563073' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Marco Antonio Escobar Nolazco
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74743912', 'Marco Antonio Escobar Nolazco', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74743912' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-09 00:00:00', 360.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BBVA JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 180.0, 1, 180.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 180.0, 1, 180.0);

-- Cliente: David Sánchez Calle
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41552489', 'David Sánchez Calle', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41552489' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-09 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BCP EPP', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 180.0, 1, 180.0);

-- Cliente: Carmen Casana López
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41878729', 'Carmen Casana López', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41878729' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-09 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BCP EPP', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 180.0, 1, 180.0);

-- Cliente: Mariano Sánchez Casana
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('79820823', 'Mariano Sánchez Casana', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '79820823' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-09 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'BCP EPP', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 100.0, 1, 100.0);

-- Cliente: Pavel N. Paredes Diaz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40371144', 'Pavel N. Paredes Diaz', '2026-01-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40371144' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-10 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'BCP JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Luis Alberto cavero alvites
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42161125', 'Luis Alberto cavero alvites', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42161125' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-08 00:00:00', 380.0, 190.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Edgar Lenin Hernandez Ore
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('23600914', 'Edgar Lenin Hernandez Ore', '2026-01-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '23600914' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-10 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 220.0, 1, 220.0);

-- Cliente: Gustavo Córdova nieto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44204321', 'Gustavo Córdova nieto', '2026-01-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44204321' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-10 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 200.0, 1, 200.0);

-- Cliente: JOSUE DEL VALLE
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('JOSUE DEL VALLE', '2026-01-11 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 8, '2026-01-11 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2026-01-11 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 0.0, 1, 0.0);

-- Cliente: Aldo Viacava Nájera
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('06967251', 'Aldo Viacava Nájera', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '06967251' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-12 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 180.0, 1, 180.0);

-- Cliente: Aldo Renzo Viacaa Benavides
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74565573', 'Aldo Renzo Viacaa Benavides', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74565573' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-12 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 180.0, 1, 180.0);

-- Cliente: EDGAR PANDURO
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('09033925', 'EDGAR PANDURO', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '09033925' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 200.0, 1, 200.0);

-- Cliente: Jandir Rivera Quispe
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70342491', 'Jandir Rivera Quispe', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70342491' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-12 00:00:00', 345.0, 165.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'MERC-PAG', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 345.0, 1, 345.0);

-- Cliente: Edu Escobedo Yalico
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74711615', 'Edu Escobedo Yalico', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74711615' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-12 00:00:00', 350.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 350.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 175.0, 1, 175.0);

-- Cliente: Fernanda Yalico Canchari
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Fernanda Yalico Canchari', '2026-01-12 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-12 00:00:00', 350.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 350.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 175.0, 1, 175.0);

-- Cliente: Nico Suárez Loayza
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Nico Suárez Loayza', '2026-01-10 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-10 00:00:00', 380.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Fritz puente
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48194840', 'Fritz puente', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48194840' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-12 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 200.0, 1, 200.0);

-- Cliente: Aaron Castillo
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Aaron Castillo', '2026-01-02 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Aaron Castillo
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Aaron Castillo', '2026-01-02 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Abdul Kazan Espinoza Guerra
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47575960', 'Abdul Kazan Espinoza Guerra', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47575960' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);

-- Cliente: Camila Alexandra Vega Tocto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72774551', 'Camila Alexandra Vega Tocto', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72774551' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 180.0, 1, 180.0);

-- Cliente: Juan Alfonso Vega Tocto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('61066668', 'Juan Alfonso Vega Tocto', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '61066668' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 180.0, 1, 180.0);

-- Cliente: Danny Simon Gonzales
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42516080', 'Danny Simon Gonzales', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42516080' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-13 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);

-- Cliente: Ronald Guerrero Romero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41052490', 'Ronald Guerrero Romero', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41052490' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-13 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);

-- Cliente: Nestor Hugo Caceres Rosa
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10302642', 'Nestor Hugo Caceres Rosa', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10302642' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 200.0, 1, 200.0);

-- Cliente: Samir Edu fiestas huamanchumo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('⁠48272392', 'Samir Edu fiestas huamanchumo', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '⁠48272392' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-13 00:00:00', 360.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 360.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 180.0, 1, 180.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 180.0, 1, 180.0);

-- Cliente: Samuel pariona
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73136673', 'Samuel pariona', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73136673' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-13 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Edwin pariona
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73136674', 'Edwin pariona', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73136674' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-13 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Ricardo Pando Córdova
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('21134360', 'Ricardo Pando Córdova', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '21134360' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 380.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 190.0, 1, 190.0);

-- Cliente: Mihel La Torre Alarcon
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72616355', 'Mihel La Torre Alarcon', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72616355' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-14 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-14 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 0.0, 1, 0.0);

-- Cliente: Rubí Jiménez picoy
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48131311', 'Rubí Jiménez picoy', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48131311' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 360.0, 210.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 4, 180.0, 1, 180.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 180.0, 1, 180.0);

-- Cliente: Elias Campos Sanchez.
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('22314008', 'Elias Campos Sanchez.', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '22314008' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 450.0, 300.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 450.0, 1, 450.0);

-- Cliente: Joao Solís Talaverano
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41590522', 'Joao Solís Talaverano', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41590522' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-15 00:00:00', 335.0, 150.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 185.0, 'YAPE JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 335.0, 1, 335.0);

-- Cliente: Cisneros Montes de Oca
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42689847', 'Cisneros Montes de Oca', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42689847' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-15 00:00:00', 335.0, 150.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 185.0, 'YAPE JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 5, 335.0, 1, 335.0);

-- Cliente: Nazaret judith abad zarco
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44412013', 'Nazaret judith abad zarco', '2025-12-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44412013' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-09 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2025-12-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Rubén Abad Zarco
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10562497', 'Rubén Abad Zarco', '2025-12-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10562497' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-09 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2025-12-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Anderson Achata
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76197577', 'Anderson Achata', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76197577' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Danilo Fernando Yánac Talaverano
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41735143', 'Danilo Fernando Yánac Talaverano', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41735143' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 110.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 110.0, 'PLIN JL', '2026-01-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 110.0, 1, 110.0);

-- Cliente: Rolando Farfán Gutiérrez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40893521', 'Rolando Farfán Gutiérrez', '2025-12-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40893521' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-27 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2025-12-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 175.0, 1, 175.0);

-- Cliente: LUIGGI VIGO PESANTES
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44384611', 'LUIGGI VIGO PESANTES', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44384611' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-06 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 200.0, 1, 200.0);

-- Cliente: Jorge Aguinaga Alvites
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('6800803', 'Jorge Aguinaga Alvites', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '6800803' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-09 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 220.0, 1, 220.0);

-- Cliente: Jandir Rivera Quispe
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70342491', 'Jandir Rivera Quispe', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70342491' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-12 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-12 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 0.0, 1, 0.0);

-- Cliente: Manuel Grados Morales
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40493159', 'Manuel Grados Morales', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40493159' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Jonathan Ramírez Flor
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45909459', 'Jonathan Ramírez Flor', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45909459' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Abdul Kazan Espinoza Guerra
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47575960', 'Abdul Kazan Espinoza Guerra', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47575960' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Jaime Raúl Santa Cruz Culquicondor
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('15753576', 'Jaime Raúl Santa Cruz Culquicondor', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '15753576' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 360.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BBVA JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 180.0, 1, 180.0);

-- Cliente: Ricardo Francisco Florian
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10114558', 'Ricardo Francisco Florian', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10114558' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-14 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);

-- Cliente: Manuel Francisco Davalos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('75527342', 'Manuel Francisco Davalos', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '75527342' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-14 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);

-- Cliente: Cesar La Rosa-Sánchez Cordero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42084574', 'Cesar La Rosa-Sánchez Cordero', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42084574' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-13 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Alexander Zambrano Vizcarra
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('61802066', 'Alexander Zambrano Vizcarra', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '61802066' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Fabricio Urbina Zambrano
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('61741943', 'Fabricio Urbina Zambrano', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '61741943' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Carlos Eduardo Cumpa alayo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70919834', 'Carlos Eduardo Cumpa alayo', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70919834' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 200.0, 1, 200.0);

-- Cliente: Juan Augusto Arrunátegui Paiva
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('25728595', 'Juan Augusto Arrunátegui Paiva', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '25728595' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-14 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: César Augusto Arrunátegui Vásquez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73171842', 'César Augusto Arrunátegui Vásquez', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73171842' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-14 00:00:00', 380.0, 270.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 110.0, '', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Anthony Giancarlos rios agesto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76601657', 'Anthony Giancarlos rios agesto', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76601657' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-14 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, '', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 150.0, 1, 150.0);

-- Cliente: DAVID DANIEL ECOS BENAVIDES
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40902213', 'DAVID DANIEL ECOS BENAVIDES', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40902213' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-14 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'BCP JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 75.0, 1, 75.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 75.0, 1, 75.0);

-- Cliente: ALEXIS FABIAN SANTA CRUZ QUILLAY
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('77060706', 'ALEXIS FABIAN SANTA CRUZ QUILLAY', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '77060706' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-15 00:00:00', 360.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BBVA JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 180.0, 1, 180.0);

-- Cliente: MARCO DEL CASTILLO RUIZ CARO
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*09493577', 'MARCO DEL CASTILLO RUIZ CARO', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*09493577' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-16 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Gerson Alejandro Nogueyra Saldarriaga
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76799413', 'Gerson Alejandro Nogueyra Saldarriaga', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76799413' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-16 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-16 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 0.0, 1, 0.0);

-- Cliente: ROSARIO TRUJILLO HIGINIO
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45963559', 'ROSARIO TRUJILLO HIGINIO', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45963559' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);

-- Cliente: ALFREDO LOZADA FERNANDEZ
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42243221', 'ALFREDO LOZADA FERNANDEZ', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42243221' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);

-- Cliente: Carlos sucasaca Vargas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('7576311', 'Carlos sucasaca Vargas', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '7576311' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-16 00:00:00', 166.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 166.0, 'LINK-CULQUI', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 166.0, 1, 166.0);

-- Cliente: Jonathan Ivan Espinoza Ruiz
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Jonathan Ivan Espinoza Ruiz', '2026-01-16 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 220.0, 110.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 110.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 220.0, 1, 220.0);

-- Cliente: Marleny Quispe Vilca
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43567257', 'Marleny Quispe Vilca', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43567257' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-16 00:00:00', 380.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Andres valencia muñoz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*005367250', 'Andres valencia muñoz', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*005367250' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-16 00:00:00', 380.0, 190.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 380.0, 1, 380.0);

-- Cliente: Carlos Zuñiga Cabrera
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10624546', 'Carlos Zuñiga Cabrera', '2026-01-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10624546' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-17 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 200.0, 1, 200.0);

-- Cliente: Mack Alexis Flores Chalco,
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('06532689,', 'Mack Alexis Flores Chalco,', '2026-01-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '06532689,' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-17 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 200.0, 1, 200.0);

-- Cliente: Jheff Alfredo Laura Martínez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45083846', 'Jheff Alfredo Laura Martínez', '2026-01-19 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45083846' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-19 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-19 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Tessy Tairo Cerrón
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46059441', 'Tessy Tairo Cerrón', '2026-01-19 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46059441' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-19 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-19 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 190.0, 1, 190.0);

-- Cliente: Julio Silverio Moreno Ruiz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10874243', 'Julio Silverio Moreno Ruiz', '2026-01-19 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10874243' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-19 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-19 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 220.0, 1, 220.0);

-- Cliente: John Ronald Alvarez Achaquihui
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40891944', 'John Ronald Alvarez Achaquihui', '2026-01-19 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40891944' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-19 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-19 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 100.0, 1, 100.0);

-- Cliente: Michael Jonathan Yaya Gutierrez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45967311', 'Michael Jonathan Yaya Gutierrez', '2026-01-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45967311' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-17 00:00:00', 220.0, 110.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 110.0, 'YAPE JL', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 220.0, 1, 220.0);

-- Cliente: Esteban Camarena Seminario
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72751542', 'Esteban Camarena Seminario', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72751542' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-20 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Patricio Pablo Rojas Salgado
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('CE 009160780', 'Patricio Pablo Rojas Salgado', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = 'CE 009160780' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-21 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 220.0, 1, 220.0);

-- Cliente: Eder Genaro Estrada Montañez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41455446', 'Eder Genaro Estrada Montañez', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41455446' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-20 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Victor Caballero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44211612', 'Victor Caballero', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44211612' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-20 00:00:00', 360.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BCP EPP', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 360.0, 1, 360.0);

-- Cliente: Carlos Matias Chico
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73261104', 'Carlos Matias Chico', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73261104' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 180.0, 1, 180.0);

-- Cliente: Joaquin Matias Chico
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('61806520', 'Joaquin Matias Chico', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '61806520' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 180.0, 1, 180.0);

-- Cliente: José Andrés Ventura Panta
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41202552', 'José Andrés Ventura Panta', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41202552' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'BCP JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 350.0, 1, 350.0);

-- Cliente: Anna Karina Colmenares Hernández
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('004684587', 'Anna Karina Colmenares Hernández', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '004684587' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'BCP JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 350.0, 1, 350.0);

-- Cliente: Lissete Hinojosa Quiroz
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Lissete Hinojosa Quiroz', '2026-01-21 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-21 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Christiam Vasquez
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Christiam Vasquez', '2026-01-22 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Diana Honores
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Diana Honores', '2026-01-22 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Gustavo Alfredo Anchante Chacaltana
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Gustavo Alfredo Anchante Chacaltana', '2026-01-22 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 110.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 110.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 110.0, 1, 110.0);

-- Cliente: Lizet De Guadalupe Roque Coronado
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Lizet De Guadalupe Roque Coronado', '2026-01-22 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: Pedro Raúl Artemio Alfaro Torres
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Pedro Raúl Artemio Alfaro Torres', '2026-01-22 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: EDWARD GALLO TORRES
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40391708', 'EDWARD GALLO TORRES', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40391708' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-23 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 175.0, 1, 175.0);

-- Cliente: KATHERINE ZUNICO FLORES
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40532533', 'KATHERINE ZUNICO FLORES', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40532533' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-23 00:00:00', 175.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 175.0, 1, 175.0);

-- Cliente: Massiel Karolina Ayala Guerra
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44767965', 'Massiel Karolina Ayala Guerra', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44767965' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-23 00:00:00', 360.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'PLIN JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 360.0, 1, 360.0);

-- Cliente: Percy Alonso Alama Porras
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Percy Alonso Alama Porras', '2026-01-17 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-17 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, '', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);

-- Cliente: CAMILA MAYHUA ALVARADO
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('CAMILA MAYHUA ALVARADO', '2026-01-17 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-17 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, '', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 6, 180.0, 1, 180.0);

-- Cliente: Omar Bruno Guillén Sánchez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72190417', 'Omar Bruno Guillén Sánchez', '2026-01-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72190417' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-24 00:00:00', 380.0, 280.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, '', '2026-01-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 380.0, 1, 380.0);

-- Cliente: wilbert palomino
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('7975001', 'wilbert palomino', '2026-01-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '7975001' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 8, '2026-01-17 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 190.0, 1, 190.0);

-- Cliente: RENZO CHAVEZ
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('RENZO CHAVEZ', '2026-01-15 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 8, '2026-01-15 00:00:00', 214.88, 110.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 104.88, 'MERC-PAG', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 214.88, 1, 214.88);

-- Cliente: ALEJANDRO CHAUCA
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('ALEJANDRO CHAUCA', '2026-01-15 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 8, '2026-01-15 00:00:00', 214.88, 110.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 104.88, 'MERC-PAG', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 7, 214.88, 1, 214.88);

-- Cliente: Anderson Achata
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76197577', 'Anderson Achata', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76197577' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 190.0, 1, 190.0);

-- Cliente: Danilo Fernando Yánac Talaverano
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41735143', 'Danilo Fernando Yánac Talaverano', '2026-01-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41735143' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-03 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-03 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 0.0, 1, 0.0);

-- Cliente: Andres valencia muñoz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*005367250', 'Andres valencia muñoz', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*005367250' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-16 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-16 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 0.0, 1, 0.0);

-- Cliente: Esteban Camarena Seminario
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72751542', 'Esteban Camarena Seminario', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72751542' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-20 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-20 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 0.0, 1, 0.0);

-- Cliente: carlos ore yufre
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46063723', 'carlos ore yufre', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46063723' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-08 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-08 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 0.0, 1, 0.0);

-- Cliente: Irene Delma Calderón Marcos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20063027', 'Irene Delma Calderón Marcos', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20063027' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-20 00:00:00', 380.0, 190.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 380.0, 1, 380.0);

-- Cliente: Eder Genaro Estrada Montañez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41455446', 'Eder Genaro Estrada Montañez', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41455446' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-20 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 190.0, 1, 190.0);

-- Cliente: Victor Caballero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44211612', 'Victor Caballero', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44211612' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-20 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-20 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 0.0, 1, 0.0);

-- Cliente: Juan Valencia León
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10117893', 'Juan Valencia León', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10117893' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-21 00:00:00', 195.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 195.0, 'LINK-CULQUI', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 195.0, 1, 195.0);

-- Cliente: Raul plácido Villavicencio torre
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('6189524', 'Raul plácido Villavicencio torre', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '6189524' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-23 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 350.0, 1, 350.0);

-- Cliente: Raul Ricardo Villavicencio Cabrera
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72903045', 'Raul Ricardo Villavicencio Cabrera', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72903045' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-23 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 350.0, 1, 350.0);

-- Cliente: César Domínguez Añanca
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20538382598', 'César Domínguez Añanca', '2026-01-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20538382598' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-22 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 200.0, 1, 200.0);

-- Cliente: Massiel Karolina Ayala Guerra
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44767965', 'Massiel Karolina Ayala Guerra', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44767965' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-23 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-23 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 0.0, 1, 0.0);

-- Cliente: Jimmy Joel lizarzaburu martel
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41855242', 'Jimmy Joel lizarzaburu martel', '2026-01-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41855242' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-24 00:00:00', 350.0, 150.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'BBVA JL', '2026-01-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 175.0, 1, 175.0);

-- Cliente: Angela Geraldine quiñones granados
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40 767009', 'Angela Geraldine quiñones granados', '2026-01-25 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40 767009' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-25 00:00:00', 350.0, 150.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'BBVA JL', '2026-01-25 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 175.0, 1, 175.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 175.0, 1, 175.0);

-- Cliente: Omar Bruno Guillén Sánchez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72190417', 'Omar Bruno Guillén Sánchez', '2026-01-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72190417' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-24 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-24 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 0.0, 1, 0.0);

-- Cliente: wilbert palomino
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('wilbert palomino', '2026-01-25 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-25 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-25 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 190.0, 1, 190.0);

-- Cliente: Fabio Martin Vilca Romero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*08537300', 'Fabio Martin Vilca Romero', '2026-01-26 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*08537300' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-26 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'BCP JL', '2026-01-26 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 150.0, 1, 150.0);

-- Cliente: Alicia Ysabel Huaman Álvarez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('⁠15434915', 'Alicia Ysabel Huaman Álvarez', '2026-01-26 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '⁠15434915' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-26 00:00:00', 380.0, 190.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-26 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 380.0, 1, 380.0);

-- Cliente: Jesús Ángel Ramos Salas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42949843', 'Jesús Ángel Ramos Salas', '2026-01-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42949843' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-27 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'BCP JL', '2026-01-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 220.0, 1, 220.0);

-- Cliente: Nikola Vera Torres
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43889926', 'Nikola Vera Torres', '2026-01-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43889926' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-27 00:00:00', 82.5, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 82.5, 'MERC-PAG', '2026-01-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 82.5, 1, 82.5);

-- Cliente: Megan Vera Tapia
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('81007981', 'Megan Vera Tapia', '2026-01-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '81007981' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-27 00:00:00', 82.5, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 82.5, 'MERC-PAG', '2026-01-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 82.5, 1, 82.5);

-- Cliente: Santiago Alex Loayza Briceño
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42506745', 'Santiago Alex Loayza Briceño', '2026-01-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42506745' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-27 00:00:00', 380.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 380.0, 'PLIN JL', '2026-01-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 190.0, 1, 190.0);

-- Cliente: José Freundt Montoya
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47428047', 'José Freundt Montoya', '2026-01-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47428047' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-27 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'PLIN JL', '2026-01-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 200.0, 1, 200.0);

-- Cliente: Mercy Apaza Cayó
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48263528', 'Mercy Apaza Cayó', '2026-01-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48263528' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-27 00:00:00', 380.0, 280.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'PLIN JL', '2026-01-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 190.0, 1, 190.0);
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 190.0, 1, 190.0);

-- Cliente: Cornelio ortiz jaimes
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*08057676', 'Cornelio ortiz jaimes', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*08057676' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-28 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'BCP JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 220.0, 1, 220.0);

-- Cliente: JUAN DIEGO ALBINO RAMOS
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74501400', 'JUAN DIEGO ALBINO RAMOS', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74501400' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-28 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'PLIN JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 180.0, 1, 180.0);

-- Cliente: Michael Parraga
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('⁠43278388', 'Michael Parraga', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '⁠43278388' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-28 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'PLIN JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 180.0, 1, 180.0);

-- Cliente: Luis Manuel villa solis
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41967125', 'Luis Manuel villa solis', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41967125' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-28 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'BBVA JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 200.0, 1, 200.0);

-- Cliente: Leonel villa abril
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Leonel villa abril', '2026-01-28 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-28 00:00:00', 100.0, 50.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'BBVA JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 100.0, 1, 100.0);

-- Cliente: Diana Vicuña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73180684', 'Diana Vicuña', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73180684' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-28 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'PLIN JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 180.0, 1, 180.0);

-- Cliente: Franco Leon
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47810241', 'Franco Leon', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47810241' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-28 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'PLIN JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 180.0, 1, 180.0);

-- Cliente: Miguel Nicho Pacheco
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('7508517', 'Miguel Nicho Pacheco', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '7508517' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-28 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'BCP JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 200.0, 1, 200.0);

-- Cliente: Jose Elías López Acostupa
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('4295 3767', 'Jose Elías López Acostupa', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '4295 3767' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-29 00:00:00', 360.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BCP JL', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 360.0, 1, 360.0);

-- Cliente: MARCO ANTONIO PRADO VALERA
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('9601263', 'MARCO ANTONIO PRADO VALERA', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '9601263' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-29 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'BBVA JL', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 200.0, 1, 200.0);

-- Cliente: Héctor paul peña ajalcriña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72510875', 'Héctor paul peña ajalcriña', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72510875' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-29 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'PLIN JL', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 220.0, 1, 220.0);

-- Cliente: Jose Luis Ñahui Ñiquen
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43154748', 'Jose Luis Ñahui Ñiquen', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43154748' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-29 00:00:00', 360.0, 180.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'PLIN JL', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 360.0, 1, 360.0);

-- Cliente: Gino Garamendi
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('2908730', 'Gino Garamendi', '2026-12-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '2908730' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-12-22 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'PLIN JL', '2026-12-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 220.0, 1, 220.0);

-- Cliente: Edson Palomino Santillan
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42312770', 'Edson Palomino Santillan', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42312770' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-29 00:00:00', 220.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 220.0, 'PLIN JL', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 220.0, 1, 220.0);

-- Cliente: Rossana Casella
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('08163189', 'Rossana Casella', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '08163189' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-29 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 350.0, 1, 350.0);

-- Cliente: Danilo Véliz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('08139122', 'Danilo Véliz', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '08139122' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-29 00:00:00', 350.0, 175.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 175.0, 'PLIN JL', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 350.0, 1, 350.0);

-- Cliente: Deyvi la rosa abarca
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Deyvi la rosa abarca', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-30 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 190.0, 1, 190.0);

-- Cliente: Rosa arica chinguel
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Rosa arica chinguel', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-30 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 190.0, 1, 190.0);

-- Cliente: Ivan Ramirez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('60758869', 'Ivan Ramirez', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '60758869' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-30 00:00:00', 180.0, 155.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 25.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 180.0, 1, 180.0);

-- Cliente: Marta Ventura
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10038690', 'Marta Ventura', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10038690' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-30 00:00:00', 180.0, 155.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 25.0, 'BBVA JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 180.0, 1, 180.0);

-- Cliente: Luís Antonio Cruz Gargate
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('9980577', 'Luís Antonio Cruz Gargate', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '9980577' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 10, '2026-01-30 00:00:00', 200.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 200.0, 1, 200.0);

-- Cliente: Jherson Zapata Quintana
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('2- 47608434', 'Jherson Zapata Quintana', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '2- 47608434' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-30 00:00:00', 170.0, 85.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 85.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 170.0, 1, 170.0);

-- Cliente: Marco Burgos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40585729', 'Marco Burgos', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40585729' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-30 00:00:00', 170.0, 85.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 85.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 170.0, 1, 170.0);

-- Cliente: Edwin Osorio
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('77204820', 'Edwin Osorio', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '77204820' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-30 00:00:00', 170.0, 85.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 85.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 170.0, 1, 170.0);

-- Cliente: RICARDO RUIZ CHAVEZ
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('RICARDO RUIZ CHAVEZ', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-30 00:00:00', 175.0, 125.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 175.0, 1, 175.0);

-- Cliente: RAFAEL RUIZ VASQUEZ
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('RAFAEL RUIZ VASQUEZ', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-30 00:00:00', 175.0, 125.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 175.0, 1, 175.0);

-- Cliente: LUIS BARRA
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72186264', 'LUIS BARRA', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72186264' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-30 00:00:00', 200.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 200.0, 1, 200.0);

-- Cliente: Elio Huayllani candenas
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Elio Huayllani candenas', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-30 00:00:00', 200.0, 150.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 200.0, 1, 200.0);

-- Cliente: Alberto Jara
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('75968050', 'Alberto Jara', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '75968050' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-30 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 180.0, 1, 180.0);

-- Cliente: Brigitte Oviedo Pérez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74609696', 'Brigitte Oviedo Pérez', '2026-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74609696' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-30 00:00:00', 180.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 90.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 180.0, 1, 180.0);

-- Cliente: Lucas Antonio prado Guerrero
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Lucas Antonio prado Guerrero', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-30 00:00:00', 160.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 160.0, 'PLIN JL', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 79, 160.0, 1, 160.0);

-- Cliente: Camila Marroqui
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Camila Marroqui', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-30 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-30 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 0.0, 1, 0.0);

-- Cliente: Américo Ruiz Gutierrez
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Américo Ruiz Gutierrez', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-30 00:00:00', 175.0, 50.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, '', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 175.0, 1, 175.0);

-- Cliente: Frank Goytisolo Ruiz
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Frank Goytisolo Ruiz', '2026-01-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-30 00:00:00', 175.0, 50.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, '', '2026-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 175.0, 1, 175.0);

-- Cliente: ALISON PALOMINO
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('ALISON PALOMINO', '2026-01-31 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 8, '2026-01-31 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 190.0, 1, 190.0);

-- Cliente: JAIME ALBAN
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('JAIME ALBAN', '2026-01-31 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 8, '2026-01-31 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 8, 190.0, 1, 190.0);

-- Cliente: Pedro Gonzales Correa
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44402809', 'Pedro Gonzales Correa', '2025-12-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44402809' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-22 00:00:00', 185.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 185.0, 'YAPE JL', '2025-12-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 185.0, 1, 185.0);

-- Cliente: Fernando García Rojas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43328710', 'Fernando García Rojas', '2025-12-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43328710' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-24 00:00:00', 190.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2025-12-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: HILDA MERCEDES ZAVALA RAMOS
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('HILDA MERCEDES ZAVALA RAMOS', '2025-12-25 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-25 00:00:00', 165.0, 85.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 80.0, 'YAPE JL', '2025-12-25 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 165.0, 1, 165.0);

-- Cliente: JULIO GODOFREDO ALIAGA SUÁREZ
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('JULIO GODOFREDO ALIAGA SUÁREZ', '2025-12-25 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-25 00:00:00', 165.0, 85.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 80.0, 'YAPE JL', '2025-12-25 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 165.0, 1, 165.0);

-- Cliente: Elio Rios Cardenas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40030613', 'Elio Rios Cardenas', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40030613' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-02 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Haydee Loayza
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('9257561', 'Haydee Loayza', '2025-12-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '9257561' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-31 00:00:00', 185.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 185.0, 'PLIN JL', '2025-12-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 185.0, 1, 185.0);

-- Cliente: Luis Esteban Ramos Nicoll
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42048172', 'Luis Esteban Ramos Nicoll', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42048172' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-05 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Karen Sánchez vilcamiche
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Karen Sánchez vilcamiche', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 180.0, 130.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 180.0, 1, 180.0);

-- Cliente: Luis Alberto Neyra Coveñas
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Luis Alberto Neyra Coveñas', '2026-01-06 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-06 00:00:00', 160.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 160.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 160.0, 1, 160.0);

-- Cliente: Andres Lucana
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46819641', 'Andres Lucana', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46819641' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Pilar coveñas Ramos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46123466', 'Pilar coveñas Ramos', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46123466' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-05 00:00:00', 450.0, 225.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 225.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 450.0, 1, 450.0);

-- Cliente: CINDY ARAUCANO
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44836199', 'CINDY ARAUCANO', '2026-01-04 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44836199' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-04 00:00:00', 170.0, 120.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-04 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 170.0, 1, 170.0);

-- Cliente: Kelly Jahuira Centeno
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76240906', 'Kelly Jahuira Centeno', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76240906' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-07 00:00:00', 166.66, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 166.66, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 166.66, 1, 166.66);

-- Cliente: Annie Jahuira Centeno
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71461985', 'Annie Jahuira Centeno', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71461985' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-07 00:00:00', 166.66, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 166.66, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 166.66, 1, 166.66);

-- Cliente: Dina Centeno Cruz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10183460', 'Dina Centeno Cruz', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10183460' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-07 00:00:00', 166.6, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 166.6, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 166.6, 1, 166.6);

-- Cliente: Victor Alfonso Garcia Castro
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Victor Alfonso Garcia Castro', '2026-01-08 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-08 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Magaly Díaz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('7524514', 'Magaly Díaz', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '7524514' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-08 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Luis Alberto Marquina Arias
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Luis Alberto Marquina Arias', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-05 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2026-01-05 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 0.0, 1, 0.0);

-- Cliente: María Luisa Díaz García
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('María Luisa Díaz García', '2026-01-05 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-05 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2026-01-05 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 0.0, 1, 0.0);

-- Cliente: EDUARDO LARIOS SALAZAR
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42945424', 'EDUARDO LARIOS SALAZAR', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42945424' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-08 00:00:00', 170.0, 85.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 85.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 170.0, 1, 170.0);

-- Cliente: Carlos Eduardo Cumpa alayo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70919834', 'Carlos Eduardo Cumpa alayo', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70919834' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-09 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Andres Felipe Jurado Aguilar
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*005862518', 'Andres Felipe Jurado Aguilar', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*005862518' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-09 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, '', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Juana Alejandrina Pallaca Mallqui
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('25661264', 'Juana Alejandrina Pallaca Mallqui', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '25661264' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-09 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 190.0, 1, 190.0);

-- Cliente: Oscar Vega
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Oscar Vega', '2026-01-09 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-09 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'EFECTIVO', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 12, 150.0, 1, 150.0);

-- Cliente: Rodrigo Bustamante Moquillaza
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44681923', 'Rodrigo Bustamante Moquillaza', '2025-12-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44681923' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-17 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-17 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 0.0, 1, 0.0);

-- Cliente: Philip Wenter Bustamante
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Philip Wenter Bustamante', '2025-12-17 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-17 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-17 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 0.0, 1, 0.0);

-- Cliente: Janeth mayhuasca lapa
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Janeth mayhuasca lapa', '2026-01-10 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-10 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: Julio la cerna Roncal
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('09683891', 'Julio la cerna Roncal', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '09683891' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-06 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 100.0, 1, 100.0);

-- Cliente: Williams Fredy Sanabria Reyes
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20029573', 'Williams Fredy Sanabria Reyes', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20029573' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: Rafael Antony Urbina Peña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('49035262', 'Rafael Antony Urbina Peña', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '49035262' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-13 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: Elias Campos Sanchez.
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('22314008', 'Elias Campos Sanchez.', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '22314008' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-14 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 0.0, 1, 0.0);

-- Cliente: Anthony Giancarlos rios agesto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76601657', 'Anthony Giancarlos rios agesto', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76601657' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-14 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, '', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 150.0, 1, 150.0);

-- Cliente: Francisco José Mesía Liau
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10477399', 'Francisco José Mesía Liau', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10477399' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-15 00:00:00', 190.0, 95.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 95.0, 'YAPE JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: Lesly chumbiriza chacon
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41271985', 'Lesly chumbiriza chacon', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41271985' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-15 00:00:00', 190.0, 140.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: Joao Solís Talaverano
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41590522', 'Joao Solís Talaverano', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41590522' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-15 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-15 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 0.0, 1, 0.0);

-- Cliente: Cisneros Montes de Oca
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42689847', 'Cisneros Montes de Oca', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42689847' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-15 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-15 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 0.0, 1, 0.0);

-- Cliente: brenda lahura vento
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46314782', 'brenda lahura vento', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46314782' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-15 00:00:00', 174.28, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 174.28, 'MERC-PAG', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 174.28, 1, 174.28);

-- Cliente: Darlen Estupiñan Euscate
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('751447752', 'Darlen Estupiñan Euscate', '2026-12-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '751447752' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-12-16 00:00:00', 185.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 185.0, 'YAPE JL', '2026-12-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 185.0, 1, 185.0);

-- Cliente: Luis Checa Alayza
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('07336007', 'Luis Checa Alayza', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '07336007' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-16 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'BBVA JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: Gerson Alejandro Nogueyra Saldarriaga
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76799413', 'Gerson Alejandro Nogueyra Saldarriaga', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76799413' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-16 00:00:00', 450.0, 350.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 450.0, 1, 450.0);

-- Cliente: Félix Uriarte Barranazuela
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40369991', 'Félix Uriarte Barranazuela', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40369991' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 190.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: Linda Aponte Huaman
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74551908', 'Linda Aponte Huaman', '2026-01-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74551908' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-17 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 180.0, 1, 180.0);

-- Cliente: Deysi Quezada Trujillo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41831539', 'Deysi Quezada Trujillo', '2026-01-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41831539' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-17 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 13, 190.0, 1, 190.0);

-- Cliente: ELIZABETH CAMONES SALVADOR
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('6855160', 'ELIZABETH CAMONES SALVADOR', '2026-01-04 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '6855160' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-04 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-04 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 100.0, 1, 100.0);

-- Cliente: María Paucar Almeyda
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('25430091', 'María Paucar Almeyda', '2026-01-04 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '25430091' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-04 00:00:00', 190.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-04 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 190.0, 1, 190.0);

-- Cliente: Néstor Vega Santaria
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Néstor Vega Santaria', '2026-01-19 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-19 00:00:00', 160.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 160.0, 'YAPE JL', '2026-01-19 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 160.0, 1, 160.0);

-- Cliente: Rita María Pau Salguero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('15983731', 'Rita María Pau Salguero', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '15983731' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-20 00:00:00', 180.99, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.99, 'MERC-PAG', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 180.99, 1, 180.99);

-- Cliente: Liliana yuchin lung timana
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46343807', 'Liliana yuchin lung timana', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46343807' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-21 00:00:00', 150.0, 75.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 75.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 150.0, 1, 150.0);

-- Cliente: Francisco Daniel Kawashita Okuyama
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43705747', 'Francisco Daniel Kawashita Okuyama', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43705747' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-21 00:00:00', 150.0, 75.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 75.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 150.0, 1, 150.0);

-- Cliente: Jennifer Ríos gil
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46178506', 'Jennifer Ríos gil', '2026-01-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46178506' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 150.0, 1, 150.0);

-- Cliente: Carlos Ignacio Efraín Matamoros Cartolin
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10709192308', 'Carlos Ignacio Efraín Matamoros Cartolin', '2026-01-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10709192308' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 190.0, 1, 190.0);

-- Cliente: Yoel Chávez nilupu
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48015781', 'Yoel Chávez nilupu', '2026-01-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48015781' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-22 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'BCP JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 190.0, 1, 190.0);

-- Cliente: Carola Ramorez Sanchez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('09444421', 'Carola Ramorez Sanchez', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '09444421' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-23 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 150.0, 1, 150.0);

-- Cliente: Jorge Napoleon Mercado Vilca
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10475612', 'Jorge Napoleon Mercado Vilca', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10475612' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-23 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 150.0, 1, 150.0);

-- Cliente: Daniel Espejo
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Daniel Espejo', '2026-01-23 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-23 00:00:00', 160.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 160.0, 'PLIN JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 160.0, 1, 160.0);

-- Cliente: María Ysabel Ruiz López
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('O5375028', 'María Ysabel Ruiz López', '2026-01-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = 'O5375028' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-24 00:00:00', 190.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 190.0, 'PLIN JL', '2026-01-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 20, 190.0, 1, 190.0);

-- Cliente: Marleny Juipa Quiñónez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10619586', 'Marleny Juipa Quiñónez', '2025-12-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10619586' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-22 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2025-12-22 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 0.0, 1, 0.0);

-- Cliente: Eddy Dumler Lazo
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Eddy Dumler Lazo', '2025-12-24 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-24 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2025-12-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 140.0, 1, 140.0);

-- Cliente: Antonio Javier García Marocho
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Antonio Javier García Marocho', '2025-12-24 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-24 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2025-12-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 140.0, 1, 140.0);

-- Cliente: Maggio Fabricio Yañez Carrion
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76324543', 'Maggio Fabricio Yañez Carrion', '2025-12-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76324543' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-24 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2025-12-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Gonzalo Aponte
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Gonzalo Aponte', '2025-12-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2025-12-30 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2025-12-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Jeanfranco Ruiz Suarez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47618556', 'Jeanfranco Ruiz Suarez', '2025-12-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47618556' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2025-12-30 00:00:00', 142.64, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 142.64, 'MERC-PAG', '2025-12-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 142.64, 1, 142.64);

-- Cliente: Piero Velarde
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41925594', 'Piero Velarde', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41925594' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'BCP JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Jessy Barrenachea
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Jessy Barrenachea', '2026-01-06 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-06 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'BCP JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 125.0, 1, 125.0);

-- Cliente: Elizabeth Álvarez
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Elizabeth Álvarez', '2026-01-06 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-06 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'BCP JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 125.0, 1, 125.0);

-- Cliente: Carlos Adolfo Cano Aquino
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42492557', 'Carlos Adolfo Cano Aquino', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42492557' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-15 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Ynes Mendoza Justo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('30422127', 'Ynes Mendoza Justo', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '30422127' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-07 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 140.0, 1, 140.0);

-- Cliente: Cynthian Milagros Lazo Chauca
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40249280', 'Cynthian Milagros Lazo Chauca', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40249280' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-07 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 140.0, 1, 140.0);

-- Cliente: Diego Sebastián Aranda Lazo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71434270', 'Diego Sebastián Aranda Lazo', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71434270' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-07 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 140.0, 1, 140.0);

-- Cliente: LUPITA QUINTANA SILVA
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('´03663755', 'LUPITA QUINTANA SILVA', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '´03663755' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-06 00:00:00', 150.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Dalia Del. Socorro Carvajal.
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('000326987', 'Dalia Del. Socorro Carvajal.', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '000326987' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-06 00:00:00', 160.0, 80.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 80.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 160.0, 1, 160.0);

-- Cliente: Alfredo reza Matos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45484567', 'Alfredo reza Matos', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45484567' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'BCP EPP', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 125.0, 1, 125.0);

-- Cliente: Elizabeth condori de la Peña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46988012', 'Elizabeth condori de la Peña', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46988012' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'BCP EPP', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 125.0, 1, 125.0);

-- Cliente: Jesús Amir Huaccho Hidalgo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73563073', 'Jesús Amir Huaccho Hidalgo', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73563073' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-07 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Brandon Barros Vizano
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48550749', 'Brandon Barros Vizano', '2026-01-06 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48550749' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-06 00:00:00', 150.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-06 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Yulisa Quispe Cuba
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41914080', 'Yulisa Quispe Cuba', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41914080' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-09 00:00:00', 140.0, 90.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 140.0, 1, 140.0);

-- Cliente: Juan Carlos borja
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47915079', 'Juan Carlos borja', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47915079' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-09 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 100.0, 1, 100.0);

-- Cliente: Helen llanos
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Helen llanos', '2026-01-09 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-09 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 125.0, 1, 125.0);

-- Cliente: Nancy Tamani
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Nancy Tamani', '2026-01-09 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-09 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 125.0, 1, 125.0);

-- Cliente: Oscar Vega
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Oscar Vega', '2026-01-09 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-09 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'EFECTIVO', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 9, 150.0, 1, 150.0);

-- Cliente: Nataly Cristina Aparicio Perez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('Rimac', 'Nataly Cristina Aparicio Perez', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = 'Rimac' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-12 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 150.0, 1, 150.0);

-- Cliente: JUAN CARLOS BORJA
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47915079', 'JUAN CARLOS BORJA', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47915079' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-12 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 0.0, 1, 0.0);

-- Cliente: Edwin Quichiz Bernal
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41151304', 'Edwin Quichiz Bernal', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41151304' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 140.0, 1, 140.0);

-- Cliente: Fernando Quichiz Bernal
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43903012', 'Fernando Quichiz Bernal', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43903012' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 140.0, 1, 140.0);

-- Cliente: Oscar Quichiz Bernal
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42333620', 'Oscar Quichiz Bernal', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42333620' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 140.0, 1, 140.0);

-- Cliente: Teófila Sánchez mellado
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('08202850', 'Teófila Sánchez mellado', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '08202850' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-13 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'BCP EPP', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 150.0, 1, 150.0);

-- Cliente: Jocsahel jose Valera morales
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('15607314737', 'Jocsahel jose Valera morales', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '15607314737' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-14 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 125.0, 1, 125.0);

-- Cliente: Jocsmar José Valera Osorio
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('007629170', 'Jocsmar José Valera Osorio', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '007629170' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-14 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 125.0, 1, 125.0);

-- Cliente: flor María esperanza Urtecho rabines
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72901811', 'flor María esperanza Urtecho rabines', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72901811' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-14 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 140.0, 1, 140.0);

-- Cliente: Marleny Juipa Quiñónez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10619586', 'Marleny Juipa Quiñónez', '2025-12-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10619586' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2025-12-22 00:00:00', 75.0, 75.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2025-12-22 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 75.0, 1, 75.0);

-- Cliente: Almonacid Lujan shonin
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('28316449', 'Almonacid Lujan shonin', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '28316449' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-14 00:00:00', 50.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 50.0, 1, 50.0);

-- Cliente: Anthony Giancarlos rios agesto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76601657', 'Anthony Giancarlos rios agesto', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76601657' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-14 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, '', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 150.0, 1, 150.0);

-- Cliente: Gerson Alejandro Nogueyra Saldarriaga
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76799413', 'Gerson Alejandro Nogueyra Saldarriaga', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76799413' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-16 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-16 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 0.0, 1, 0.0);

-- Cliente: Janet Quincho Ruiz
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Janet Quincho Ruiz', '2026-01-16 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 140.0, 70.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 70.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 140.0, 1, 140.0);

-- Cliente: Gloria Stefany Garcia López
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Gloria Stefany Garcia López', '2026-01-16 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 75.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 75.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 75.0, 1, 75.0);

-- Cliente: JEAN CARLOS CARDENAS CALMA
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('JEAN CARLOS CARDENAS CALMA', '2026-01-16 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 10, 140.0, 1, 140.0);

-- Cliente: Pilar coveñas Ramos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46123466.0', 'Pilar coveñas Ramos', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46123466.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-05 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, 'YAPE JL', '2026-01-05 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 0.0, 1, 0.0);

-- Cliente: Elias Campos Sanchez.
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('22314008.0', 'Elias Campos Sanchez.', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '22314008.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-14 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-14 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 0.0, 1, 0.0);

-- Cliente: Karin Chacon Gonzales
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10421776631.0', 'Karin Chacon Gonzales', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10421776631.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-15 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 150.0, 1, 150.0);

-- Cliente: Aaron Castillo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71523029.0', 'Aaron Castillo', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71523029.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-20 00:00:00', 130.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 130.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 130.0, 1, 130.0);

-- Cliente: Norita Isabel Uraco Acho
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40171540.0', 'Norita Isabel Uraco Acho', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40171540.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-20 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 140.0, 1, 140.0);

-- Cliente: Miguel Rios López
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20613656058.0', 'Miguel Rios López', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20613656058.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: Diana Mora Terrones
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20613656058.0', 'Diana Mora Terrones', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20613656058.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: Jesús Geldres Pérez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70954105.0', 'Jesús Geldres Pérez', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70954105.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 150.0, 70.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 80.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 150.0, 1, 150.0);

-- Cliente: Henry Manuel Miranda Cuya
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('4475965.0', 'Henry Manuel Miranda Cuya', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '4475965.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-23 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'BCP EPP', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: Sthefany Milagros Alata Romero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46210391.0', 'Sthefany Milagros Alata Romero', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46210391.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-23 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'BCP EPP', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: JESUS ENRIQUE MEDINA LAZO
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74471041.0', 'JESUS ENRIQUE MEDINA LAZO', '2026-01-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74471041.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-22 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 140.0, 1, 140.0);

-- Cliente: Milagros Lazo Osorio
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41062653.0', 'Milagros Lazo Osorio', '2026-01-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41062653.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-22 00:00:00', 140.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 140.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 140.0, 1, 140.0);

-- Cliente: Jennifer Ríos gil
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46178506.0', 'Jennifer Ríos gil', '2026-01-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46178506.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-22 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 150.0, 1, 150.0);

-- Cliente: Luz Fabiola Rodriguez Guerrero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47699885.0', 'Luz Fabiola Rodriguez Guerrero', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47699885.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-23 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'YAPE JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: Andre Geusepee Cruz Barzola
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42601788.0', 'Andre Geusepee Cruz Barzola', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42601788.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-23 00:00:00', 125.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 125.0, 'YAPE JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: Anderson Meneses Vilca
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Anderson Meneses Vilca', '2026-01-23 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-23 00:00:00', 150.0, 100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 150.0, 1, 150.0);

-- Cliente: ROXANA PACCINI
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10096401286.0', 'ROXANA PACCINI', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10096401286.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: LUIS PEREZ
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('9935937.0', 'LUIS PEREZ', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '9935937.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-21 00:00:00', 125.0, 62.5, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 62.5, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 11, 125.0, 1, 125.0);

-- Cliente: Miguel Angel Minaya Gonzalez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72323085.0', 'Miguel Angel Minaya Gonzalez', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72323085.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-08 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Edinson grower lostaunau padilla
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71825325.0', 'Edinson grower lostaunau padilla', '2026-01-14 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71825325.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-14 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-14 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Mauro ore
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47901451.0', 'Mauro ore', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47901451.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-16 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'BCP JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Jherardina Ore Rengifo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42371088.0', 'Jherardina Ore Rengifo', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42371088.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 50.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 50.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 50.0, 1, 50.0);

-- Cliente: Juvenal Zamalloa Aguirre
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42567710.0', 'Juvenal Zamalloa Aguirre', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42567710.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-16 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Joel flores jacinto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44931185.0', 'Joel flores jacinto', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44931185.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-21 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'BCP JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Ricardo franco davila nuñez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70678890.0', 'Ricardo franco davila nuñez', '2026-01-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70678890.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-28 00:00:00', 70.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 70.0, 'PLIN JL', '2026-01-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 70.0, 1, 70.0);

-- Cliente: César Juan Cortijo Villalobos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20725023.0', 'César Juan Cortijo Villalobos', '2025-01-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20725023.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-01-30 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'PLIN JL', '2025-01-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Benjamin Lau Chiong
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('9377789.0', 'Benjamin Lau Chiong', '2026-01-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '9377789.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-29 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, '', '2026-01-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Fredy Condori Hancco
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('45287120.0', 'Fredy Condori Hancco', '2026-01-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '45287120.0' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-31 00:00:00', 150.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 150.0, 'PLIN JL', '2026-01-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 15, 150.0, 1, 150.0);

-- Cliente: Roberto Gabriel Flores Butron
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72685604', 'Roberto Gabriel Flores Butron', '2025-12-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72685604' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-10 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-10 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Eber huayhua vargas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46749055', 'Eber huayhua vargas', '2025-12-11 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46749055' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-11 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-11 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Andrés Sebastian Ordenes Lobatón
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('1240711', 'Andrés Sebastian Ordenes Lobatón', '2025-12-18 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '1240711' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-18 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-18 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Jordan Aaron Suarez Acuña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71412900', 'Jordan Aaron Suarez Acuña', '2025-12-25 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71412900' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-25 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-25 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Miguel  Angel Peña Mata
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73851205', 'Miguel  Angel Peña Mata', '2025-12-26 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73851205' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-26 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-26 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Carlos Díaz Ocaña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('7454502', 'Carlos Díaz Ocaña', '2025-12-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '7454502' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-27 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-27 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Lucia Jessica Chávez Ramírez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20609390264', 'Lucia Jessica Chávez Ramírez', '2025-12-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20609390264' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-27 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-27 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Maycol Jonathan paz Retamozo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('60393570', 'Maycol Jonathan paz Retamozo', '2025-12-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '60393570' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-29 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-29 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Brian portilla orquiz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43712509', 'Brian portilla orquiz', '2025-12-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43712509' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-29 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-29 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: César Miguel Oré Astorga
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71176371', 'César Miguel Oré Astorga', '2025-12-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71176371' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-31 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-31 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Jorge luis padilla zapata
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47729335', 'Jorge luis padilla zapata', '2025-12-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47729335' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-28 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-28 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Abraham Basilio Rojas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47162261', 'Abraham Basilio Rojas', '2025-12-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47162261' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2025-12-22 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2025-12-22 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Ricardo Junior Boza Valdiviezo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42588957', 'Ricardo Junior Boza Valdiviezo', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42588957' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-15 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-15 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Piero André Damas Salhuana
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('75014725', 'Piero André Damas Salhuana', '2026-01-01 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '75014725' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-01 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-01 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: María Bertha Chavarría rios
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*09837904', 'María Bertha Chavarría rios', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*09837904' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-02 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-02 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Magda Rosa Aguilar Vigo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41364774', 'Magda Rosa Aguilar Vigo', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41364774' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-02 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-02 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Yessire Meneses Bellido
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73487354', 'Yessire Meneses Bellido', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73487354' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-02 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'PLIN JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 180.0, 1, 180.0);

-- Cliente: Luis Esteban Ramos Nicoll
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42048172', 'Luis Esteban Ramos Nicoll', '2026-01-04 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42048172' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-04 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-04 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Miguel Angel Gutti Huaman
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*09902780', 'Miguel Angel Gutti Huaman', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*09902780' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-05 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-05 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Pablo Fernandez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('´005508766', 'Pablo Fernandez', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '´005508766' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-05 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, 'PLIN JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 100.0, 1, 100.0);

-- Cliente: Robert Montilla
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('´02438088', 'Robert Montilla', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '´02438088' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-08 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 180.0, 1, 180.0);

-- Cliente: Jessica Escarlen
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('77087419', 'Jessica Escarlen', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '77087419' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-08 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-08 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 0.0, 1, 0.0);

-- Cliente: Anderson Denis López López
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76785683', 'Anderson Denis López López', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76785683' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-08 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-08 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 0.0, 1, 0.0);

-- Cliente: Luis Ivan Novoa Espinoza
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('26728586', 'Luis Ivan Novoa Espinoza', '2026-01-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '26728586' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-10 00:00:00', 160.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 160.0, 'PLIN JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 160.0, 1, 160.0);

-- Cliente: Aldair fuentes castro
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71131738', 'Aldair fuentes castro', '2026-01-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71131738' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-10 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, '', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 180.0, 1, 180.0);

-- Cliente: James Enrique Ccaira Quispe
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10741489142', 'James Enrique Ccaira Quispe', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10741489142' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 4, '2026-01-12 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 180.0, 1, 180.0);

-- Cliente: Jorge Luis cabrera Montenegro
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10719169', 'Jorge Luis cabrera Montenegro', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10719169' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-13 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-13 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 0.0, 1, 0.0);

-- Cliente: Carlos Eduardo Cumpa alayo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('70919834', 'Carlos Eduardo Cumpa alayo', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '70919834' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-13 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'BCP JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 180.0, 1, 180.0);

-- Cliente: Ricardo Boza
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Ricardo Boza', '2026-01-15 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-15 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '0', '2026-01-15 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 14, 0.0, 1, 0.0);

-- Cliente: Martha lucia Gutiérrez Pacheco
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71474780', 'Martha lucia Gutiérrez Pacheco', '2026-01-18 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71474780' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-18 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-18 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 180.0, 1, 180.0);

-- Cliente: Osmar Rosas Tomas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42944658', 'Osmar Rosas Tomas', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42944658' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-20 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 180.0, 1, 180.0);

-- Cliente: Edver luna goñi
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41229116', 'Edver luna goñi', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41229116' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-20 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 180.0, 1, 180.0);

-- Cliente: Luna Alejandra Peláez Egoavil
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72505663', 'Luna Alejandra Peláez Egoavil', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72505663' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-13 00:00:00', 180.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 180.0, 'YAPE JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 180.0, 1, 180.0);

-- Cliente: Walter Seyfarth
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Walter Seyfarth', '2026-01-15 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 1, '2026-01-15 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-15 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 21, 0.0, 1, 0.0);

-- Cliente: Wilder francisco hurtado torres
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41318618', 'Wilder francisco hurtado torres', '2025-11-30 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41318618' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-11-30 00:00:00', 1400.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'YAPE JL', '2025-11-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1400.0, 1, 1400.0);

-- Cliente: Geoffrey Mogollon
INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Geoffrey Mogollon', '2025-10-30 00:00:00');
SET @cliente_id = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-10-30 00:00:00', 100.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, '', '2025-10-30 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 100.0, 1, 100.0);

-- Cliente: Ynalia Noemí Quispe Valdivia
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10257770', 'Ynalia Noemí Quispe Valdivia', '2025-12-03 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10257770' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-03 00:00:00', 1400.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, '', '2025-12-03 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1400.0, 1, 1400.0);

-- Cliente: Isolina Ruiz roman
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44028083', 'Isolina Ruiz roman', '2025-12-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44028083' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-09 00:00:00', 1300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, '', '2025-12-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1300.0, 1, 1300.0);

-- Cliente: Roberto Gabriel Flores Butron
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72685604', 'Roberto Gabriel Flores Butron', '2025-12-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72685604' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-10 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, '', '2025-12-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: Eber huayhua vargas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46749055', 'Eber huayhua vargas', '2025-12-11 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46749055' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-11 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 100.0, '', '2025-12-11 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: Victor Mario Zapata Vilchez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('75240792', 'Victor Mario Zapata Vilchez', '2012-12-17 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '75240792' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2012-12-17 00:00:00', 1300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 800.0, '', '2012-12-17 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1300.0, 1, 1300.0);

-- Cliente: Andrés Sebastian Ordenes Lobatón
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('1240711', 'Andrés Sebastian Ordenes Lobatón', '2025-12-18 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '1240711' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-18 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, '', '2025-12-18 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1500.0, 1, 1500.0);

-- Cliente: Rodrigo Romero León
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('72543662', 'Rodrigo Romero León', '2025-12-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '72543662' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-20 00:00:00', 1300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, '', '2025-12-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1300.0, 1, 1300.0);

-- Cliente: Jordan Aaron Suarez Acuña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71412900', 'Jordan Aaron Suarez Acuña', '2025-12-25 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71412900' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-25 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2025-12-25 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: Nilber Eduardo portocarrero López
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46847985', 'Nilber Eduardo portocarrero López', '2021-12-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46847985' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2021-12-10 00:00:00', 300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'YAPE JL', '2021-12-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 300.0, 1, 300.0);

-- Cliente: Ronald Rene cuya lozano
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44048290', 'Ronald Rene cuya lozano', '2025-12-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44048290' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2025-12-22 00:00:00', 1400.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1400.0, 'YAPE JL', '2025-12-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1400.0, 1, 1400.0);

-- Cliente: Miguel  Angel Peña Mata
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73851205', 'Miguel  Angel Peña Mata', '2025-12-26 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73851205' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-26 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'BCP JL', '2025-12-26 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1500.0, 1, 1500.0);

-- Cliente: Carlos Díaz Ocaña
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('7454502', 'Carlos Díaz Ocaña', '2025-12-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '7454502' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-27 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'PLIN JL', '2025-12-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1500.0, 1, 1500.0);

-- Cliente: Lucia Jessica Chávez Ramírez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('20609390264', 'Lucia Jessica Chávez Ramírez', '2025-12-27 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '20609390264' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-27 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'PLIN JL', '2025-12-27 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: Jorge luis padilla zapata
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47729335', 'Jorge luis padilla zapata', '2025-12-28 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47729335' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-28 00:00:00', 1400.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1400.0, 'BCP JL', '2025-12-28 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1400.0, 1, 1400.0);

-- Cliente: Miguel Angel Martinez Galvez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48371859', 'Miguel Angel Martinez Galvez', '2025-12-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48371859' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-29 00:00:00', 1300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1300.0, 1, 1300.0);

-- Cliente: Maycol Jonathan paz Retamozo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('60393570', 'Maycol Jonathan paz Retamozo', '2025-12-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '60393570' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-29 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'PLIN JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: Brian portilla orquiz
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43712509', 'Brian portilla orquiz', '2025-12-29 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43712509' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-29 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'BCP JL', '2025-12-29 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: César Miguel Oré Astorga
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('71176371', 'César Miguel Oré Astorga', '2025-12-31 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '71176371' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-31 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'BCP JL', '2025-12-31 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: Piero André Damas Salhuana
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('75014725', 'Piero André Damas Salhuana', '2026-01-01 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '75014725' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-01 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'BCP JL', '2026-01-01 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: María Bertha Chavarría rios
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*09837904', 'María Bertha Chavarría rios', '2026-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*09837904' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-02 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 1500.0, 1, 1500.0);

-- Cliente: Magda Rosa Aguilar Vigo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('41364774', 'Magda Rosa Aguilar Vigo', '2025-01-02 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '41364774' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-01-02 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 250.0, 'PLIN JL', '2025-01-02 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1500.0, 1, 1500.0);

-- Cliente: Luis Esteban Ramos Nicoll
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42048172', 'Luis Esteban Ramos Nicoll', '2026-01-04 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42048172' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-04 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-04 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1500.0, 1, 1500.0);

-- Cliente: Miguel Angel Gutti Huaman
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('*09902780', 'Miguel Angel Gutti Huaman', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '*09902780' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-05 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'YAPE JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1500.0, 1, 1500.0);

-- Cliente: Julio cesar Nalbarte villar
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47415409', 'Julio cesar Nalbarte villar', '2026-01-05 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47415409' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-05 00:00:00', 250.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 250.0, 'BCP JL', '2026-01-05 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 16, 250.0, 1, 250.0);

-- Cliente: Demetrio Ramos Mancilla
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('21000873', 'Demetrio Ramos Mancilla', '2026-01-07 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '21000873' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-07 00:00:00', 1300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1300.0, 'BCP JL', '2026-01-07 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1300.0, 1, 1300.0);

-- Cliente: Oscar Vega Orue
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44975220', 'Oscar Vega Orue', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44975220' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-09 00:00:00', 1300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'YAPE JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1300.0, 1, 1300.0);

-- Cliente: Rodrigo Sebastian Salazar Palacios
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('61176942', 'Rodrigo Sebastian Salazar Palacios', '2026-01-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '61176942' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-10 00:00:00', 1300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'BCP JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 17, 1300.0, 1, 1300.0);

-- Cliente: Ruedi Mazuelos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('44579272', 'Ruedi Mazuelos', '2025-12-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '44579272' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-20 00:00:00', 1400.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1400.0, 'YAPE JL', '2025-12-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1400.0, 1, 1400.0);

-- Cliente: Richard Carlo Rodriguez Balcazar
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('18149957', 'Richard Carlo Rodriguez Balcazar', '2025-12-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '18149957' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-20 00:00:00', 1400.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1400.0, 'YAPE JL', '2025-12-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1400.0, 1, 1400.0);

-- Cliente: Abraham Basilio Rojas
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47162261', 'Abraham Basilio Rojas', '2025-12-22 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47162261' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2025-12-22 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'PLIN JL', '2025-12-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1500.0, 1, 1500.0);

-- Cliente: Ricardo Junior Boza Valdiviezo
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42588957', 'Ricardo Junior Boza Valdiviezo', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42588957' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-15 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'PLIN JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1500.0, 1, 1500.0);

-- Cliente: Anderson Denis López López
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('76785683', 'Anderson Denis López López', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '76785683' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-08 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1500.0, 1, 1500.0);

-- Cliente: Gabriel Maximiliano Sánchez Castro
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('61790541', 'Gabriel Maximiliano Sánchez Castro', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '61790541' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-08 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1500.0, 1, 1500.0);

-- Cliente: Jhon Eduardo Ruiz Sachun
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('48020635', 'Jhon Eduardo Ruiz Sachun', '2026-01-08 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '48020635' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-08 00:00:00', 800.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 800.0, 'YAPE JL', '2026-01-08 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 800.0, 1, 800.0);

-- Cliente: Luis Alberto Pérez zevallos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('46636853', 'Luis Alberto Pérez zevallos', '2026-01-09 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '46636853' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-09 00:00:00', 1400.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1400.0, 'BCP JL', '2026-01-09 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1400.0, 1, 1400.0);

-- Cliente: Pedro Chavez
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('43382092', 'Pedro Chavez', '2026-01-10 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '43382092' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-10 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'BBVA JL', '2026-01-10 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1500.0, 1, 1500.0);

-- Cliente: Fabrizzio Mijael Lima Obregón
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('73158664', 'Fabrizzio Mijael Lima Obregón', '2026-01-12 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '73158664' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-12 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'BCP JL', '2026-01-12 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1500.0, 1, 1500.0);

-- Cliente: Elvis Gustavo lluen Torres
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('47843276', 'Elvis Gustavo lluen Torres', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '47843276' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-13 00:00:00', 1300.0, 1000.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'BCP JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1300.0, 1, 1300.0);

-- Cliente: Jorge Luis cabrera Montenegro
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10719169', 'Jorge Luis cabrera Montenegro', '2026-01-13 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10719169' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-13 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'BCP JL', '2026-01-13 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1500.0, 1, 1500.0);

-- Cliente: Peter Günther Kost Soto
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('10107901791', 'Peter Günther Kost Soto', '2026-01-15 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '10107901791' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-15 00:00:00', 1500.0, 1200.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'BCP JL', '2026-01-15 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1500.0, 1, 1500.0);

-- Cliente: Jessica Escarlen
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('77087419', 'Jessica Escarlen', '2026-01-16 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '77087419' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 6, '2026-01-16 00:00:00', 300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'YAPE JL', '2026-01-16 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 300.0, 1, 300.0);

-- Cliente: Mirko jesus neyra solis
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('77438358', 'Mirko jesus neyra solis', '2026-01-19 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '77438358' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 5, '2026-01-19 00:00:00', 1500.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1500.0, 'BCP EPP', '2026-01-19 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1500.0, 1, 1500.0);

-- Cliente: Edward Crispín paredes
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40641102,', 'Edward Crispín paredes', '2026-01-20 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40641102,' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 2, '2026-01-20 00:00:00', 300.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'YAPE JL', '2026-01-20 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 300.0, 1, 300.0);

-- Cliente: Milton Fuentes Guerrero
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40988719', 'Milton Fuentes Guerrero', '2026-01-21 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40988719' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-21 00:00:00', 1300.0, 1100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'YAPE JL', '2026-01-21 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 22, 1300.0, 1, 1300.0);

-- Cliente: eva bendezú gallegos
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('40780085', 'eva bendezú gallegos', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '40780085' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-23 00:00:00', 1300.0, 1100.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 200.0, 'BBVA JL', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1300.0, 1, 1300.0);

-- Cliente: Alberto Gallegos Arias
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('25789881', 'Alberto Gallegos Arias', '2026-01-23 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '25789881' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 3, '2026-01-23 00:00:00', 800.0, 500.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 300.0, 'BCP EPP', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 800.0, 1, 800.0);

-- Cliente: mateo quispe solis
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('74730077', 'mateo quispe solis', '2026-01-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '74730077' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-24 00:00:00', 0.0, 0.0, 'PAGADO', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 0.0, '', '2026-01-24 00:00:00', 'PENDIENTE');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 0.0, 1, 0.0);

-- Cliente: Luis Alberto cavero alvites
INSERT IGNORE INTO clientes (dni_ruc, nombre_completo, fecha_registro) VALUES ('42161125', 'Luis Alberto cavero alvites', '2026-01-24 00:00:00');
SET @cliente_id = (SELECT id FROM clientes WHERE dni_ruc = '42161125' LIMIT 1);
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cliente_id, 7, '2026-01-24 00:00:00', 1300.0, 200.0, 'PARCIAL', 'DEL_DIA');
SET @venta_id = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@venta_id, 1100.0, 'PLIN JL', '2026-01-24 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@venta_id, 18, 1300.0, 1, 1300.0);

-- ==========================================
-- CORPORATIVO (REGLAS ESTRICTAS)
-- ==========================================

INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('Jorge', '2026-01-23 00:00:00');
SET @cli_jorge = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cli_jorge, 2, '2026-01-23 00:00:00', 2420, 720, 'PARCIAL', 'DEL_DIA');
SET @v_jorge = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@v_jorge, 1700, 'BCP EPP', '2026-01-23 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@v_jorge, 77, 2420, 1, 2420);

INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('BRENDA FARAON', '2026-01-22 00:00:00');
SET @cli_brenda = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cli_brenda, 10, '2026-01-22 00:00:00', 1724, 0, 'PAGADO', 'DEL_DIA');
SET @v_b = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@v_b, 1724, 'PAGO', '2026-01-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@v_b, 78, 1724, 1, 1724);

INSERT INTO clientes (nombre_completo, fecha_registro) VALUES ('JULIO GELDRES', '2026-12-22 00:00:00');
SET @cli_julio = LAST_INSERT_ID();
INSERT INTO ventas (cliente_id, usuario_id, fecha_venta, total, saldo_pendiente, estado, tipo_venta) VALUES (@cli_julio, 10, '2026-12-22 00:00:00', 500, 0, 'PAGADO', 'DEL_DIA');
SET @v_j = LAST_INSERT_ID();
INSERT INTO pagos (venta_id, monto, metodo_pago, fecha_pago, estado) VALUES (@v_j, 500, 'PAGO', '2026-12-22 00:00:00', 'PAGADO');
INSERT INTO detalle_ventas (venta_id, evento_id, precio_unitario, cantidad, subtotal) VALUES (@v_j, 78, 500, 1, 500);

COMMIT;