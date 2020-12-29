-- Criação tabela complexos
CREATE TABLE complexos (
   	complexo_id INTEGER NOT NULL PRIMARY KEY,
    complexo_nome VARCHAR(50) UNIQUE -- https://www.w3schools.com/sql/sql_primarykey.asp
);
-- Criação tabela complexos

-- Inserção dados na tabela complexos
INSERT INTO complexos
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

-- Criação tabela unidades
CREATE TABLE unidades (
   	complexo_id INTEGER,
	unidade_id INTEGER NOT NULL PRIMARY KEY,
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
INSERT INTO unidades
VALUES
(4,1,'CEPAI','Centro Psíquico da Adolescência e Infância','Centro Psíquico da Adolescência e Infância','Belo Horizonte','Capital','Porte I'),
(4,2,'CHPB','Centro Hospitalar Psiquiátrico de Barbacena','Centro Hospitalar Psiquiátrico de Barbacena','Barbacena','interior','Porte II'),
(4,3,'CMT','Centro Mineiro de Toxicomania','Centro Mineiro de Toxicomania','Belo Horizonte','Capital','Porte I'),
(3,4,'CSPD','Casa de Saúde Padre Damião','Casa de Saúde Padre Damião','Ubá','interior','Porte I'),
(3,5,'CSSFA','Casa de Saúde São Francisco de Assis','Casa de Saúde São Francisco de Assis','Bambuí','interior','Porte I'),
(3,6,'CSSFE','Casa de Saúde Santa Fé','Casa de Saúde Santa Fé','Três Corações','interior','Porte I'),
(3,7,'CSSI','Casa de Saúde Santa Izabel','Casa de Saúde Santa Izabel','Betim','interior','Porte I'),
(1,8,'HAC','Hospital Alberto Cavalcanti','Hospital Alberto Cavalcanti','Belo Horizonte','Capital','Porte III'),
(3,9,'HCM','Hospital Cristiano Machado','Hospital Cristiano Machado','Sabará','interior','Porte I'),
(2,10,'HEM','Hospital Eduardo de Menezes','Hospital Eduardo de Menezes','Belo Horizonte','Capital','Porte II'),
(4,11,'HGV','Hospital Galba Velloso','Hospital Galba Velloso','Belo Horizonte','Capital','Porte II'),
(5,12,'HIJPII','Hospital Infantil João Paulo II','Hospital Infantil João Paulo II','Belo Horizonte','Capital','Porte III'),
(1,13,'HJK','Hospital Júlia Kubitschek','Hospital Júlia Kubitschek','Belo Horizonte','Capital','Porte IV'),
(5,14,'HJXXIII','Hospital João XXIII','Hospital João XXIII','Belo Horizonte','Capital','Porte IV'),
(5,15,'HMAL','Hospital Maria Amélia Lins','Hospital João XXIII','Belo Horizonte','Capital','Porte II'),
(4,16,'IRS','Instituto Raul Soares','Instituto Raul Soares','Belo Horizonte','Capital','Porte II'),
(2,17,'HRAD','Hospital Regional Antônio Dias','Hospital Regional Antônio Dias','Patos de Minas','interior','Porte III'),
(2,18,'HRBJA','Hospital Regional de Barbacena Doutor José Américo','Hospital Regional de Barbacena Doutor José Américo','Barbacena','interior','Porte II'),
(2,19,'HRJP','Hospital Regional João Penido','Hospital Regional João Penido','Juiz de Fora','interior','Porte III'),
(2,20,'MOV','Maternidade Odete Valadares','Maternidade Odete Valadares','Belo Horizonte','Capital','Porte IV');

-- Conferência tabela unidades
SELECT * FROM unidades;

SELECT COUNT(*) from unidades;

SELECT c.complexo_nome, u.* FROM unidades u
NATURAL JOIN complexos c

SELECT c.complexo_nome, COUNT(u.*)FROM unidades u
NATURAL JOIN complexos c
GROUP BY 1
ORDER BY 2 DESC;
-- Conferência tabela unidades