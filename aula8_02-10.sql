use gdghd;

select * from curso;
select * from area;
select * from aluno;

-- Quanto é o faturamento total da universidade? Exbir como faturamento
select sum(mensalidade) as 'Faturamento' from aluno;

-- Quanto é o faturamento da universidade por cidade do aluno?
select cidade_endereco, sum(mensalidade) from aluno group by cidade_endereco;

-- Qual a quantidade de alunos que vem de cada cidade??
select cidade_endereco, count(matricula) as 'qtde de alunos' from aluno group by cidade_endereco;

-- Quais cidades tem mais de 2 alunos frequentando a escola?
select cidade_endereco from aluno group by cidade_endereco having count(matricula) > 2;

-- Quantas vagas são ofertadas por área?
select descricao, sum(vagas) from curso, area where curso.cod_area = area.codigo group by cod_area;

-- Relacione o nome do aluno e do curso que ele faz;
select aluno.nome as 'Aluno', curso.nome as 'Curso' from aluno, curso where aluno.cod_curso = codigo;
