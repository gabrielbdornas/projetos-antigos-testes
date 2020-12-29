SELECT * FROM hospital_groups;

SELECT COUNT(*) FROM hospital_groups; -- 5

/*
DELETE FROM hospital_groups

INSERT INTO hospital_groups
VALUES
(1,'Complexo de Especialidades','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(2,'Complexo de Hospitais de Referência','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(3,'Complexo de Reabilitação e Cuidados Integrados','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(4,'Complexo de Saude Mental','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(5,'Complexo de Urgência e Emergência','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309');

*/

SELECT * FROM hospitals;

SELECT COUNT(*) FROM hospitals; -- 20

/*
DELETE FROM hospitals

INSERT INTO hospitals
VALUES
(1,4,'CEPAI','Centro Psíquico da Adolescência e Infância','Centro Psíquico da Adolescência e Infância','Belo Horizonte','Capital','Porte I','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(2,4,'CHPB','Centro Hospitalar Psiquiátrico de Barbacena','Centro Hospitalar Psiquiátrico de Barbacena','Barbacena','interior','Porte II','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(3,4,'CMT','Centro Mineiro de Toxicomania','Centro Mineiro de Toxicomania','Belo Horizonte','Capital','Porte I','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(4,3,'CSPD','Casa de Saúde Padre Damião','Casa de Saúde Padre Damião','Ubá','interior','Porte I','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(5,3,'CSSFA','Casa de Saúde São Francisco de Assis','Casa de Saúde São Francisco de Assis','Bambuí','interior','Porte I','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(6,3,'CSSFE','Casa de Saúde Santa Fé','Casa de Saúde Santa Fé','Três Corações','interior','Porte I','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(7,3,'CSSI','Casa de Saúde Santa Izabel','Casa de Saúde Santa Izabel','Betim','interior','Porte I','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(8,1,'HAC','Hospital Alberto Cavalcanti','Hospital Alberto Cavalcanti','Belo Horizonte','Capital','Porte III','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(9,3,'HCM','Hospital Cristiano Machado','Hospital Cristiano Machado','Sabará','interior','Porte I','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(10,2,'HEM','Hospital Eduardo de Menezes','Hospital Eduardo de Menezes','Belo Horizonte','Capital','Porte II','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(11,4,'HGV','Hospital Galba Velloso','Hospital Galba Velloso','Belo Horizonte','Capital','Porte II','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(12,5,'HIJPII','Hospital Infantil João Paulo II','Hospital Infantil João Paulo II','Belo Horizonte','Capital','Porte III','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(13,1,'HJK','Hospital Júlia Kubitschek','Hospital Júlia Kubitschek','Belo Horizonte','Capital','Porte IV','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(14,5,'HJXXIII','Hospital João XXIII','Hospital João XXIII','Belo Horizonte','Capital','Porte IV','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(15,5,'HMAL','Hospital Maria Amélia Lins','Hospital João XXIII','Belo Horizonte','Capital','Porte II','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(16,4,'IRS','Instituto Raul Soares','Instituto Raul Soares','Belo Horizonte','Capital','Porte II','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(17,2,'HRAD','Hospital Regional Antônio Dias','Hospital Regional Antônio Dias','Patos de Minas','interior','Porte III','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(18,2,'HRBJA','Hospital Regional de Barbacena Doutor José Américo','Hospital Regional de Barbacena Doutor José Américo','Barbacena','interior','Porte II','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(19,2,'HRJP','Hospital Regional João Penido','Hospital Regional João Penido','Juiz de Fora','interior','Porte III','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(20,2,'MOV','Maternidade Odete Valadares','Maternidade Odete Valadares','Belo Horizonte','Capital','Porte IV','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309');

*/

-- Conferência Join hospitais com hospital_groups
SELECT hg.name complexo, COUNT(h.id) hospitais
FROM hospitals h
JOIN hospital_groups hg
ON h.hospital_group_id = hg.id
GROUP BY 1
ORDER BY 2 DESC
-- Conferência Join hospitais com hospital_groups

SELECT * FROM procedure_groups

SELECT COUNT(*) FROM procedure_groups -- 8

/*
DELETE FROM procedure_groups

INSERT INTO procedure_groups
VALUES
(1,'01','Ações de promoção e prevenção em saúde','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(2,'02','Procedimentos com finalidade diagnóstica','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(3,'03','Procedimentos clínicos','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(4,'04','Procedimentos cirúrgicos','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(5,'05','Transplantes de orgãos, tecidos e células','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(6,'06','Medicamentos','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(7,'07','Órteses, próteses e materiais especiais','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(8,'08','Ações complementares da atenção à saúde','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309');

*/

SELECT * FROM procedure_sub_groups

SELECT COUNT(*) FROM procedure_sub_groups -- 59

SELECT pg.id, pg.name, COUNT(psg.id)
FROM procedure_sub_groups psg
JOIN procedure_groups pg
ON psg.procedure_group_id = pg.id
GROUP BY 1, 2
ORDER BY 1

/*
DELETE FROM procedure_sub_groups

INSERT INTO procedure_sub_groups
VALUES
(1,1,'0101','Ações coletivas/individuais em saúde','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(2,1,'0102','Vigilância em saúde','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(3,2,'0201','Coleta de material','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(4,2,'0202','Diagnóstico em laboratório clínico','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(5,2,'0203','Diagnóstico por anatomia patológica e citopatológica','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(6,2,'0204','Diagnóstico por radiologia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(7,2,'0205','Diagnóstico por ultrassonografia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(8,2,'0206','Diagnóstico por tomografia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(9,2,'0207','Diagnóstico por ressonância magnética','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(10,2,'0208','Diagnóstico por medicina nuclear in vivo','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(11,2,'0209','Diagnóstico por endoscopia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(12,2,'0210','Diagnóstico por radiologia intervencionista','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(13,2,'0211','Métodos diagnósticos em especialidades','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(14,2,'0212','Diagnóstico e procedimentos especiais em hemoterapia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(15,2,'0213','Diagnóstico em vigilância epidemiológica e ambiental','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(16,2,'0214','Diagnóstico por teste rápido','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(17,3,'0301','Consultas/atendimentos/acompanhamentos','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(18,3,'0302','Fisioterapia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(19,3,'0303','Tratamentos clínicos (outras especialidades)','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(20,3,'0304','Tratamento em oncologia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(21,3,'0305','Tratamento em nefrologia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(22,3,'0306','Hemoterapia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(23,3,'0307','Tratamentos odontológicos','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(24,3,'0308','Tratamento de lesões, envenenamento e outros, decorr','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(25,3,'0309','Terapias especializadas','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(26,3,'0310','Parto e nascimento','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(27,4,'0401','Pequenas cirurgias e cirurgias de pele. Tecido subcu','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(28,4,'0402','Cirurgia de glândulas endócrinas','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(29,4,'0403','Cirurgia do sistema nervoso central e periférico','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(30,4,'0404','- Cirurgia das vias aéreas superiores, da face, da ca','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(31,4,'0405','Cirurgia do aparelho da visão','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(32,4,'0406','Cirurgia do aparelho circulatório','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(33,4,'0407','Cirurgia do aparelho digestivo, orgãos anexos e pare','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(34,4,'0408','Cirurgia do sistema osteomuscular','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(35,4,'0409','Cirurgia do aparelho geniturinário','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(36,4,'0410','Cirurgia de mama','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(37,4,'0411','Cirurgia obstétrica','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(38,4,'0412','Cirurgia torácica','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(39,4,'0413','Cirurgia reparadora','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(40,4,'0414','Bucomaxilofacial','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(41,4,'0415','Outras cirurgias','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(42,4,'0416','Cirurgia em oncologia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(43,4,'0417','Anestesiologia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(44,4,'0418','Cirurgia em nefrologia','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(45,5,'0501','Coleta e exames para fins de doação de orgãos, tecid','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(46,5,'0502','Avaliação de morte encefálica','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(47,5,'0503','Ações relacionadas a doação de orgãos e tecidos para','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(48,5,'0504','Processamento de tecidos para transplante','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(49,5,'0505','Transplante de orgãos tecidos e células','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(50,5,'0506','Acompanhamento e intercorrências no pré e pós transp','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(51,6,'0601','Medicamentos  de dispensação excepcional','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(52,6,'0602','Medicamentos estratégicos','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(53,6,'0603','Medicamentos de âmbito hospitalar e urgência','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(54,6,'0604','Componente especializado da assistência farmacêutica','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(55,7,'0701','Órteses, próteses e materiais especiais não relacion','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(56,7,'0702','Órteses, próteses e materiais especiais relacionados','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(57,8,'0801','Ações relacionadas ao estabelecimento','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(58,8,'0802','Ações relacionadas ao atendimento','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309'),
(59,8,'0803','Autorização / Regulação','2020-07-21 15:17:32.751309','2020-07-21 15:17:32.751309');

*/

