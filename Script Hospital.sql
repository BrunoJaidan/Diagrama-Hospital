SELECT *
FROM Consulta
WHERE YEAR(Data_Consulta) = 2020 OR Convênio = 1;

SELECT AVG(Valor)
FROM Consulta
WHERE YEAR(Data_Consulta) = 2020 OR Convênio = 1;

-- Dados das internações com data de alta maior que a prevista
SELECT *
FROM Internação
WHERE Data_Alta_Real > Data_Alta_Prevista;

-- Receituário completo da primeira consulta registrada com receituário associado
SELECT *
FROM Receituário
WHERE ID_Consulta = (SELECT MIN(ID_Consulta) FROM Consulta WHERE ID_Consulta = ID_Consulta);

-- Dados da consulta de maior e menor valor (não realizadas sob convênio)
SELECT *
FROM Consulta
WHERE Convênio = 0
ORDER BY Valor DESC
LIMIT 1;

SELECT *
FROM Consulta
WHERE Convênio = 0
ORDER BY Valor
LIMIT 1;

-- Dados das internações com cálculo do valor total
SELECT Internação.*, Quarto.Valor_Diário * DATEDIFF(Data_Alta_Real, Data_Entrada) AS Valor_Total
FROM Internação
INNER JOIN Quarto ON Internação.ID_Quarto = Quarto.ID_Quarto;

-- Data, procedimento e número de quarto de internações em quartos do tipo “apartamento”
SELECT Data_Alta_Real, Procedimentos, Quarto.ID_Quarto
FROM Internação
INNER JOIN Quarto ON Internação.ID_Quarto = Quarto.ID_Quarto
WHERE Quarto.Tipo_Quarto = 'Apartamento';

-- Nome do paciente, data da consulta e especialidade de consultas de pacientes menores de 18 anos e não pediatria
SELECT Paciente.Nome AS Nome_Paciente, Consulta.Data_Consulta, Consulta.Especialidade
FROM Paciente
INNER JOIN Consulta ON Paciente.ID_Paciente = Consulta.ID_Paciente
WHERE TIMESTAMPDIFF(YEAR, Paciente.Data_Nascimento, CURDATE()) < 18
AND Consulta.Especialidade != 'Pediatria'
ORDER BY Consulta.Data_Consulta;

-- Nome do paciente, nome do médico, data da internação e procedimentos de internações em "enfermaria" por médicos de "gastroenterologia"
SELECT Paciente.Nome AS Nome_Paciente, Médico.Nome AS Nome_Médico, Internação.Data_Alta_Real, Internação.Procedimentos
FROM Paciente
INNER JOIN Internação ON Paciente.ID_Paciente = Internação.ID_Paciente
INNER JOIN Médico ON Internação.ID_Médico = Médico.ID_Médico
INNER JOIN Especialidade ON Médico.Especialidade = Especialidade.Nome
INNER JOIN Quarto ON Internação.ID_Quarto = Quarto.ID_Quarto
WHERE Especialidade.Nome = 'Gastroenterologia' AND Quarto.Tipo_Quarto = 'Enfermaria';

-- Nomes dos médicos, seus CRMs e a quantidade de consultas realizadas por cada um
SELECT Médico.Nome, Médico.CRM, COUNT(Consulta.ID_Médico) AS Qtd_Consultas
FROM Médico
LEFT JOIN Consulta ON Médico.ID_Médico = Consulta.ID_Médico
GROUP BY Médico.Nome;

-- Todos os médicos que têm "Gabriel" no nome
SELECT *
FROM Médico
WHERE Nome LIKE '%Gabriel%';

-- Nomes, CREs e número de internações de enfermeiros com mais de uma internação
SELECT Enfermeiro.Nome, Enfermeiro.CRE, COUNT(Internação_Enfermeiro.ID_Internação) AS Qtd_Internações
FROM Enfermeiro
INNER JOIN Internação_Enfermeiro ON Enfermeiro.ID_Enfermeiro = Internação_Enfermeiro.ID_Enfermeiro
GROUP BY Enfermeiro.Nome, Enfermeiro.CRE
HAVING COUNT(Internação_Enfermeiro.ID_Internação) > 1;