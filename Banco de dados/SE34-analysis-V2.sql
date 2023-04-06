create database SE34_analysis;
use SE34_analysis;
drop database SE34_analysis;


-- TABELA EMPRESA
CREATE TABLE empresa (
	idEmpresa int primary key auto_increment,
	nomeEmpresa varchar(70),
	CNPJ char(18) NOT NULL,
	emailEmpresa varchar(70) NOT NULL
) ;

-- DESCIÇÃO DA TABELA EMPRESA
DESC empresa;

-- INSERINDO DADOS NA TABELA EMPRESA
insert into empresa values
(null,'Empresa1', '07.526.557/0001-00','empresa1@gmail.com'),
(null,'Empresa2', '08.930.673/0001-24','empresa2@gmail.com' ),
(null,'Empresa3', '07.526.557/0001-00','empresa3@gmail.com'),
(null,'Empresa4', '21.900.899/0001-79','empresa4@gmail.com');

-- SELECTS DA TABELA EMPRESA
SELECT * FROM empresa;

-- TABELA USUARIO
CREATE TABLE usuario (
	
	idUsuario INT PRIMARY KEY auto_increment,
    nome varchar(70) NOT NULL,
	email varchar(70) NOT NULL,
	cpf varchar(11) NOT NULL,
    telCel varchar(11),
    senha varchar(8) NOT NULL,
    nivelAcesso int NOT NULL,
    fkEmpresa int,
    constraint chkNivelAcesso check (nivelAcesso IN (1, 2, 3)), -- NIVEIS DE ACESSO: 1 = ACESSO TOTAL, 2 = ACESSO NORMAL, 3 = ACESSO RESTRITO
    constraint fkEmpresa1 foreign key (fkEMpresa) references empresa (idEmpresa)
) auto_increment = 100;

-- DESCRIÇÃO DA TABELA USUARIO
DESC usuario;


-- INSERINDO DADOS NA TABELA USUARIO
INSERT INTO  usuario VALUES 
	( null, 'Maria Paula', 'maria.bsilva@sptech.school', '12345589754', '11973114571','12345678' ,1, 1),
	( null, 'Nathan',  'nathan@sptech.school', '78336589754', '1196789645','12345678' , 2, 4),
	( null, 'Kaori',  'kaori@sptech.school', '45836589754', '11915879642','12345678' , 1,  3),
	( null, 'Emily',  'emily@sptech.school', '10236589754', '11945789632', '12345678' ,3, 2),
    ( null, 'Thalison',  'thalison@sptech.school', '78636587822', '11789489647','12345678' , 2, 2);

-- SELECTS DA TABELA USUARIO
select * from usuario;
-- CONSULTA O LOGIN / EMAIL E SENHA
SELECT email, senha FROM usuario;
-- CONSUTAR DE QUAL EMPRESA É
SELECT * FROM  usuario join empresa on fkEmpresa = idEmpresa;


-- TABELA DO CAMINHÃO
create table caminhao (
idCaminhao int primary key auto_increment,
qntCaminhoes INT NOT NULL,
fkEmpresa INT,
constraint fkEmpresa2 foreign key (fkEmpresa) references empresa (idEmpresa)
) auto_increment = 50;

-- INSERINDO OS DADOS
insert into caminhao values 
(null , 5 , 1),
(null , 4 , 2),
(null , 7 , 3),
(null , 6 , 4);

-- SELECTS DA TABLEA CAMINHÃO
SELECT * FROM  caminhao;
SELECT * FROM caminhao as C join empresa as E on C.fkEmpresa  = E.idEmpresa join usuario as U on U.fkEmpresa = E.idEmpresa;

-- TABELA SENSOR
CREATE TABLE sensor (

	idSensor INT PRIMARY KEY auto_increment,
	statusSensor varchar(10),
	fkcaminhao INT,
	constraint fkCaminhao foreign key (fkCaminhao) references caminhao (idCaminhao),
	constraint ckcStatusSensor CHECK 
	(statusSensor in ('Ativo', 'Inativo', 'Manutenção'))

);
drop table sensor;
 -- DESCIÇÃO DA TABELA SENSOR
DESC sensor;
select * from sensor;

-- INSERINDO DADOS NA TABELA SENSOR
INSERT INTO sensor VALUES 
	(null, 'Ativo' , 50),
	(null,  'Inativo' , 51),
	(null,  'Manutenção' , 52),
	(null,  'Ativo' , 53);

-- SELECTS DA TABELA SENSOR
SELECT * FROM sensor;
SELECT * FROM  sensor join caminhao on fkCaminhao = idCaminhao join empresa on fkEmpresa = idEmpresa;

-- TABELA TEMPERATURA E UMIDADE
CREATE TABLE Leitura (
	idTempUmi INT auto_increment,
	temp double,
    umi double,
	dtHora datetime default current_timestamp,
    fkSensor INT,
	constraint fkSensor foreign key (fkSensor) references sensor (idSensor),
	constraint pkComposta primary key (idTempUmi, fkSensor));

 -- DESCIÇÃO DA TABELA LEITURA	
DESC temp;

-- INSERINDO DADOS NA TABELA LEITURA
-- VALORES DO LM35 E DHT11
INSERT INTO leitura (temp, umi, fkSensor) VALUES 
	('-18.0','75.00',1),
	('-1.5', '90.00', 2),
	('0','80.00', 3),
	('-2.0','85.00', 4);

-- SELECTS DA TABELA TEMPERATURA
SELECT * FROM leitura;
SELECT * FROM leitura JOIN sensor ON fkSensor = idSensor;
SELECT * FROM leitura JOIN sensor ON fkSensor = idSensor JOIN caminhao ON fkCaminhao = idCaminhao JOIN empresa ON fkEmpresa = idEmpresa;

