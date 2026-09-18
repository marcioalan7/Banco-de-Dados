-- Em quais cidades os alunos moram? Exiba valores distintos
select distinct cidade_endereco from aluno;

-- De cada cidade, em quais códigos de cursos os alunos estão matriculados?
select * from aluno;
select distinct cidade_endereco, cod_curso from aluno where cidade_endereco is not null;

-- Funções de Agregação:
-- soma = sum 
-- contagem = count
-- maior = max 
-- menor = min
-- media = avg => abreviação de average

-- Quantos alunos temos cadastrados?
select count(matricula) from aluno;

-- Qual valor da maior e da menor mensalidade?
select max(mensalidade), min(mensalidade) from aluno;

-- Quantos cursos não tem coordenador?
-- Quantos cursos tem coordenador?
-- Qual o nome do aluno mais novo?
-- Qual a média de vagas ofertadas?
-- Qual faturamento com as menalidades pagas?