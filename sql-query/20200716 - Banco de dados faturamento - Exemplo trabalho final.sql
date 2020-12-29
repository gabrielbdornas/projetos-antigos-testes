-- Criação tabela complexos
CREATE TABLE complexos (
   	complexo_id INTEGER NOT NULL PRIMARY KEY,
    complexo_nome VARCHAR(50) UNIQUE -- https://www.w3schools.com/sql/sql_primarykey.asp
);
-- Criação tabela complexos

-- Inserção dados na tabela complexos
INSERT INTO complexos (complexo_id, complexo_nome)
VALUES
(1,'Complexo de Especialidades'),
(2,'Complexo de Hospitais de Referência'),
(3,'Complexo de Reabilitação e Cuidados Integrados'),
(4,'Complexo de Saude Mental'),
(5,'Complexo de Urgência e Emergência');
-- Inserção dados na tabela complexos

-- Conferência tabela complexos
SELECT * FROM complexos c
-- Conferência tabela complexos



CREATE TABLE unidades (
   	unidade_id INTEGER NOT NULL PRIMARY KEY,
    complexo_id INTEGER,
	FOREIGN KEY (complexo_id) REFERENCES complexos(complexo_id) -- https://www.w3schools.com/sql/sql_foreignkey.asp
);


