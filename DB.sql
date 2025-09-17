-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS industria_sentinel CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE industria_sentinel;

-- Tabela usuario
CREATE TABLE IF NOT EXISTS usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('OPERADOR', 'SUPERVISOR', 'ENGENHEIRO') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela equipamento
CREATE TABLE IF NOT EXISTS equipamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    tipo VARCHAR(255) NOT NULL,
    status ENUM('ATIVO', 'INATIVO', 'MANUTENCAO') NOT NULL,
    localizacao VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela telemetria
CREATE TABLE IF NOT EXISTS telemetria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipamento_id INT NOT NULL,
    timestamp DATETIME NOT NULL,
    temperatura DECIMAL(5,2) NOT NULL,
    vibracao DECIMAL(5,2) NOT NULL,
    consumo DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (equipamento_id) REFERENCES equipamento(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabela alerta
CREATE TABLE IF NOT EXISTS alerta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipamento_id INT NOT NULL,
    timestamp DATETIME NOT NULL,
    nivel ENUM('INFO', 'WARN', 'CRIT') NOT NULL,
    mensagem TEXT NOT NULL,
    status ENUM('ABERTO', 'ACK', 'FECHADO') NOT NULL,
    usuario_ack_id INT,
    FOREIGN KEY (equipamento_id) REFERENCES equipamento(id) ON DELETE CASCADE,
    FOREIGN KEY (usuario_ack_id) REFERENCES usuario(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Inserção de dados fictícios
-- Usuários
INSERT INTO usuario (username, password, role) VALUES
('oper_ana', '123', 'OPERADOR'),
('sup_joao', '123', 'SUPERVISOR'),
('eng_maria', '123', 'ENGENHEIRO');

-- Equipamentos
INSERT INTO equipamento (nome, tipo, status, localizacao) VALUES
('Motor Principal 1', 'Motor', 'ATIVO', 'Linha de Produção A'),
('Sensor de Temperatura 1', 'Sensor', 'ATIVO', 'Forno 1'),
('Braço Robótico 3', 'Robô', 'MANUTENCAO', 'Montagem Final'),
('Compressor C-200', 'Compressor', 'INATIVO', 'Estoque'),
('Válvula Hidráulica V-5', 'Válvula', 'ATIVO', 'Sistema Hidráulico');

-- Telemetria (50 registros para os últimos 7 dias)
DELIMITER //
CREATE PROCEDURE InsertTelemetryData()
BEGIN
    DECLARE i INT DEFAULT 0;
    DECLARE equip_id INT;
    DECLARE ts DATETIME;
    DECLARE temp DECIMAL(5,2);
    DECLARE vib DECIMAL(5,2);
    DECLARE cons DECIMAL(5,2);

    WHILE i < 50 DO
        SET equip_id = (SELECT id FROM equipamento ORDER BY RAND() LIMIT 1);
        SET ts = NOW() - INTERVAL FLOOR(RAND() * 7 * 24 * 60 * 60) SECOND; -- Últimos 7 dias
        SET temp = 20.0 + (RAND() * 60.0); -- 20 a 80
        SET vib = 0.1 + (RAND() * 4.9); -- 0.1 a 5.0
        SET cons = 10.0 + (RAND() * 90.0); -- 10 a 100

        INSERT INTO telemetria (equipamento_id, timestamp, temperatura, vibracao, consumo)
        VALUES (equip_id, ts, temp, vib, cons);
        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL InsertTelemetryData();
DROP PROCEDURE InsertTelemetryData;

-- Alertas (10 registros)
INSERT INTO alerta (equipamento_id, timestamp, nivel, mensagem, status, usuario_ack_id) VALUES
((SELECT id FROM equipamento WHERE nome = 'Motor Principal 1'), NOW() - INTERVAL 2 DAY, 'CRIT', 'Temperatura do motor excedeu limite crítico.', 'ABERTO', NULL),
((SELECT id FROM equipamento WHERE nome = 'Sensor de Temperatura 1'), NOW() - INTERVAL 1 DAY, 'WARN', 'Leitura de temperatura inconsistente.', 'ACK', (SELECT id FROM usuario WHERE username = 'sup_joao')),
((SELECT id FROM equipamento WHERE nome = 'Braço Robótico 3'), NOW() - INTERVAL 3 DAY, 'INFO', 'Manutenção preventiva agendada para Braço Robótico 3.', 'FECHADO', (SELECT id FROM usuario WHERE username = 'eng_maria')),
((SELECT id FROM equipamento WHERE nome = 'Compressor C-200'), NOW() - INTERVAL 5 HOUR, 'CRIT', 'Compressor C-200 offline inesperadamente.', 'ABERTO', NULL),
((SELECT id FROM equipamento WHERE nome = 'Válvula Hidráulica V-5'), NOW() - INTERVAL 10 HOUR, 'WARN', 'Pressão hidráulica abaixo do ideal.', 'ACK', (SELECT id FROM usuario WHERE username = 'oper_ana')),
((SELECT id FROM equipamento WHERE nome = 'Motor Principal 1'), NOW() - INTERVAL 1 DAY, 'INFO', 'Verificação de rotina no Motor Principal 1.', 'FECHADO', (SELECT id FROM usuario WHERE username = 'oper_ana')),
((SELECT id FROM equipamento WHERE nome = 'Sensor de Temperatura 1'), NOW() - INTERVAL 3 HOUR, 'CRIT', 'Falha total no Sensor de Temperatura 1.', 'ABERTO', NULL),
((SELECT id FROM equipamento WHERE nome = 'Braço Robótico 3'), NOW() - INTERVAL 2 DAY, 'WARN', 'Vibração anormal detectada no Braço Robótico 3.', 'ACK', (SELECT id FROM usuario WHERE username = 'eng_maria')),
((SELECT id FROM equipamento WHERE nome = 'Compressor C-200'), NOW() - INTERVAL 1 DAY, 'INFO', 'Compressor C-200 religado com sucesso.', 'FECHADO', (SELECT id FROM usuario WHERE username = 'sup_joao')),
((SELECT id FROM equipamento WHERE nome = 'Válvula Hidráulica V-5'), NOW() - INTERVAL 6 HOUR, 'CRIT', 'Vazamento detectado na Válvula Hidráulica V-5.', 'ABERTO', NULL);