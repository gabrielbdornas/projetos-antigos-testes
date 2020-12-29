-- https://www.w3schools.com/sql/sql_autoincrement.asp
-- https://www.postgresqltutorial.com/postgresql-serial/
-- Criação tabela complexos
CREATE TABLE complexos (
   	complexo_id SERIAL PRIMARY KEY,
    complexo_nome VARCHAR(50) UNIQUE -- https://www.w3schools.com/sql/sql_primarykey.asp
);
-- Criação tabela complexos

-- Inserção dados na tabela complexos
INSERT INTO complexos (complexo_nome)
VALUES
('Complexo de Especialidades'),
('Complexo de Hospitais de Referência'),
('Complexo de Reabilitação e Cuidados Integrados'),
('Complexo de Saude Mental'),
('Complexo de Urgência e Emergência');
-- Inserção dados na tabela complexos

-- Conferência tabela complexos
SELECT * FROM complexos c
-- Conferência tabela complexos

-- Criação tabela unidades
CREATE TABLE unidades (
   	complexo_id INTEGER,
	unidade_id SERIAL PRIMARY KEY,
    unidade_sigla VARCHAR(10) UNIQUE,
	unidade_nome VARCHAR(50) UNIQUE,
	unidade_faturamento VARCHAR(50),
	unidade_municipio VARCHAR(20),
	unidade_regionalizacao VARCHAR(10),
	unidade_porte VARCHAR(10),	
	FOREIGN KEY (complexo_id) REFERENCES complexos(complexo_id) -- https://www.w3schools.com/sql/sql_foreignkey.asp
);
-- Criação tabela unidades

-- Inserção dados na tabela unidades
INSERT INTO unidades (complexo_id, unidade_sigla, unidade_nome, unidade_faturamento, unidade_municipio, unidade_regionalizacao, unidade_porte)
VALUES
(4,'CEPAI','Centro Psíquico da Adolescência e Infância','Centro Psíquico da Adolescência e Infância','Belo Horizonte','Capital','Porte I'),
(4,'CHPB','Centro Hospitalar Psiquiátrico de Barbacena','Centro Hospitalar Psiquiátrico de Barbacena','Barbacena','interior','Porte II'),
(4,'CMT','Centro Mineiro de Toxicomania','Centro Mineiro de Toxicomania','Belo Horizonte','Capital','Porte I'),
(3,'CSPD','Casa de Saúde Padre Damião','Casa de Saúde Padre Damião','Ubá','interior','Porte I'),
(3,'CSSFA','Casa de Saúde São Francisco de Assis','Casa de Saúde São Francisco de Assis','Bambuí','interior','Porte I'),
(3,'CSSFE','Casa de Saúde Santa Fé','Casa de Saúde Santa Fé','Três Corações','interior','Porte I'),
(3,'CSSI','Casa de Saúde Santa Izabel','Casa de Saúde Santa Izabel','Betim','interior','Porte I'),
(1,'HAC','Hospital Alberto Cavalcanti','Hospital Alberto Cavalcanti','Belo Horizonte','Capital','Porte III'),
(3,'HCM','Hospital Cristiano Machado','Hospital Cristiano Machado','Sabará','interior','Porte I'),
(2,'HEM','Hospital Eduardo de Menezes','Hospital Eduardo de Menezes','Belo Horizonte','Capital','Porte II'),
(4,'HGV','Hospital Galba Velloso','Hospital Galba Velloso','Belo Horizonte','Capital','Porte II'),
(5,'HIJPII','Hospital Infantil João Paulo II','Hospital Infantil João Paulo II','Belo Horizonte','Capital','Porte III'),
(1,'HJK','Hospital Júlia Kubitschek','Hospital Júlia Kubitschek','Belo Horizonte','Capital','Porte IV'),
(5,'HJXXIII','Hospital João XXIII','Hospital João XXIII','Belo Horizonte','Capital','Porte IV'),
(5,'HMAL','Hospital Maria Amélia Lins','Hospital João XXIII','Belo Horizonte','Capital','Porte II'),
(4,'IRS','Instituto Raul Soares','Instituto Raul Soares','Belo Horizonte','Capital','Porte II'),
(2,'HRAD','Hospital Regional Antônio Dias','Hospital Regional Antônio Dias','Patos de Minas','interior','Porte III'),
(2,'HRBJA','Hospital Regional de Barbacena Doutor José Américo','Hospital Regional de Barbacena Doutor José Américo','Barbacena','interior','Porte II'),
(2,'HRJP','Hospital Regional João Penido','Hospital Regional João Penido','Juiz de Fora','interior','Porte III'),
(2,'MOV','Maternidade Odete Valadares','Maternidade Odete Valadares','Belo Horizonte','Capital','Porte IV');

select * from unidades

select c.complexo_nome, u.* from unidades u
natural join complexos c