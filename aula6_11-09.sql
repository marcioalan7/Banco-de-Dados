create schema adryanmarcio;
use adryanmarcio;


CREATE TABLE professor(
	matricula integer PRIMARY key AUTO_INCREMENT,
    nome varchar(30),
 	salario decimal (8,2),
    formação varchar(50),
    CH_disponivel INTEGER
);
CREATE TABLE curso(
	codigo integer PRIMARY key AUTO_INCREMENT,
    nome varchar(40),
	nivel VARCHAR (20),
    vagas_porAno integer,
    mat_coordenador integer,
    FOREIGN key (mat_coordenador) REFERENCES professor(matricula)
);
CREATE TABLE sala(
	numero integer PRIMARY key,
    descricao varchar(50),
    andar integer,
    capacidade integer
);
CREATE TABLE disciplina(
	id integer PRIMARY key AUTO_INCREMENT,
    nome varchar(30),
    qtde_matriculados integer,
	cod_curso INTEGER,
    mat_professor INTEGER,
    CH integer,
    dia_semana VARCHAR(15),
    turno CHAR,
    num_sala integer,
    FOREIGN key (cod_curso) REFERENCES curso(codigo),
    FOREIGN key (num_sala) REFERENCES sala(numero),
    FOREIGN key (mat_professor) REFERENCES professor(matricula)
);
INSERT INTO professor VALUES
	(1,'Maria Xavier', 5697.52,'Ciências da Computação',10),
	(2,'Leticia Vitória', 6987.32,'Administração',12),
	(3,'Silvia Veras', 7512.14,'Engenharia de Software',0),
	(4,'Vagner Montana', 5876.78,'Análise e Desenvolvimento de Sistemas',null),
	(5,'Carla Pedrosa', 5697.96,'Ciências da Computação',25),
	(6,'Pedro Cardoso', 7512.52,'Engenharia de Software',12);
INSERT INTO curso VALUES
	(1,'Redes de Computadores','Técnico',80,5),
	(2,'Informática para Internet','Técnico',140,null),
	(3,'Análise e Desenvolvimento de Sistemas','Superior',100,4),
	(4,'Comércio','Técnico',60,null),
	(5,'Banco de Dados','Pós-graduação',50,5);
INSERT INTO sala VALUES
	(1, 'Sala de aula 1',1,50),(2, 'Sala de aula 2',1,30),(3, 'Sala de aula 3',1,25),
	(4, 'Auditório',3,300),(5,'Sala Multimídia',2,50),(6,'Laboratório 01',2,23),(7,'Laboratório 02',2,21);
INSERT INTO disciplina VALUES
	(1,'Banco de Dados',23,1,3,60,'segunda-feira','N',6),
	(2,'Banco de Dados 1',19,3,5,80,'sexta-feira','N',6),
	(3,'Administração Geral',34,4,null,30,'sexta-feira','T',1),
	(4,'Contabilidade',0,4,2,45,'segunda-feira','N',2),
	(5,'Multimídia',12,3,5,60,'terça-feira','M',5),
	(6,'TCC',8,5,2,50,'quarta-feira','N',3),
	(7,'Metodologia Científica'	,40,1,2,30,'quarta-feira','T',null),
	(8,'Programação 2',0 ,3,1,40,'quinta-feira','M',6),
	(9,'Português Instrumental',null,null,null,40,'quarta-feira','T',2),
	(10,'Banco de Dados',32,1,3,60,'segunda-feira','N',6),
	(11,'Banco de Dados 2',14,3,1,80,'segunda-feira','T',7),
	(12,'Inglês Técnico',15,4,null,50,'segunda-feira','T',2);
    
-- 1. Liste o nome e o salário dos professores, ordenando os resultados pelo nome do docente. As colunas devem ser exibidas: NOME DO PROFESSOR e SALÁRIO DO PROFESSOR
select * from professor;
select nome as 'NOME DO PROFESSOR', salario as 'SALÁRIO DO PROFESSOR' from professor order by nome;

-- 2. Liste o nome da disciplina e a quantidade de matriculados, ordenando das turmas mais cheias para as mais vazias.
select * from disciplina;
select nome, qtde_matriculados from disciplina order by qtde_matriculados desc;

-- 3. Exiba as informações das 3 disciplinas com menos alunos matriculados.
select * from disciplina;
select * from disciplina order by qtde_matriculados limit 3;

-- 4. Liste a relação de professores e as formações dos que possuem salário entre a R$ 4.000,00 e R$ 7.500,00. Exiba como DOCENTE e FORMAÇÃO DOCENTE.
select * from professor;
select nome as 'DOCENTE', formação as 'FORMAÇÃO DOCENTE' from professor where salario between 4000 and 7500;

-- 5. Liste o nome e a CH disponível dos professores que possuem CH disponível cadastrada, exibindo as colunas como Professor e Horas_Disponiveis.
-- Ordene o resultado pela CH disponível do maior para o menor.
select * from professor;
select nome as 'Professor', ch_disponivel as'Horas_Disponiveis' from professor where ch_disponivel is not null order by ch_disponivel desc;

-- 6. Liste o nome, salário e formação dos professores que recebem entre R$ 5.500,00 e R$ 7.500,00.
-- Utilize os aliases Professor, Salario e Formacao, ordene pelo salário do maior para o menor e apresente somente os 3 primeiros resultados.
select * from professor;
select nome as 'Professor', salario as 'Salario', formação as 'Formacao' from professor where salario between 5500 and 7500 order by salario desc limit 3;

-- 7. Liste as disciplinas cujo nome contém "Banco", apresentando o nome da disciplina e a quantidade de matriculados. Ordene pela quantidade de matriculados do maior para o menor e mostre apenas as 2 primeiras.
select * from disciplina;
select nome, qtde_matriculados from disciplina where nome like '%Banco%' order by qtde_matriculados desc limit 2;

-- 8. Liste os professores que:
-- possuem CH disponível entre 10 e 25 horas;
-- possuem salário superior a R$ 5.500,00;
-- não possuem formação em Administração.
select * from professor;
select * from professor where (ch_disponivel between 10 and 25) and (salario > 5500) and not(formação = 'Administração'); 

-- 9. Liste as disciplinas que possuem mais alunos matriculados do que a disciplina "Multimídia".
-- Apresente o nome e a quantidade de matriculados, ordenando do maior para o menor.
select * from  disciplina;
select nome, qtde_matriculados from professor where qtde_matriculados >
	( select qtde_matriculados from professor where nome = 'Multimídia') order by qtde_matriculados desc;

-- 10. Liste as disciplinas que não possuem professor cadastrado e que não aconteçam nas segundas nem nas quartas.

-- 11. Liste as disciplinas ministradas pelo professor que possui a maior CH disponível.

-- 12. Liste os professores que não são coordenadores de nenhum curso.
-- Apresente nome, formação e salário, ordenando pelo nome em ordem alfabética.

-- 13. Liste as disciplinas que:
-- possuem professor cadastrado;
-- são ministradas por professores cujo salário é maior que R$ 5.800,00;
-- o nome da disciplina não contém "TCC";
-- e possuem uma carga horária entre 40 e 80 horas.
-- Apresente: nome da disciplina, Alunos, Carga_Horaria
-- Ordene primeiro pela carga horária em ordem decrescente e, em caso de empate, pela quantidade de alunos em ordem decrescente.