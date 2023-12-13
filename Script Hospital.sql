SELECT *
FROM Consulta
WHERE YEAR(Data_Consulta) = 2020 OR Convênio = 1;

SELECT AVG(Valor)
FROM Consulta
WHERE YEAR(Data_Consulta) = 2020 OR Convênio = 1;

SELECT *
FROM Internação
WHERE Data_Alta_Real > Data_Alta_Prevista;

SELECT *
FROM Receituário
WHERE ID_Consulta = (SELECT MIN(ID_Consulta) FROM Consulta WHERE ID_Consulta = ID_Consulta);

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

SELECT Internação.*, Quarto.Valor_Diário * DATEDIFF(Data_Alta_Real, Data_Entrada) AS Valor_Total
FROM Internação
INNER JOIN Quarto ON Internação.ID_Quarto = Quarto.ID_Quarto;

SELECT Data_Alta_Real, Procedimentos, Quarto.ID_Quarto
FROM Internação
INNER JOIN Quarto ON Internação.ID_Quarto = Quarto.ID_Quarto
WHERE Quarto.Tipo_Quarto = 'Apartamento';

SELECT Paciente.Nome AS Nome_Paciente, Consulta.Data_Consulta, Consulta.Especialidade
FROM Paciente
INNER JOIN Consulta ON Paciente.ID_Paciente = Consulta.ID_Paciente
WHERE TIMESTAMPDIFF(YEAR, Paciente.Data_Nascimento, CURDATE()) < 18
AND Consulta.Especialidade != 'Pediatria'
ORDER BY Consulta.Data_Consulta;

SELECT Paciente.Nome AS Nome_Paciente, Médico.Nome AS Nome_Médico, Internação.Data_Alta_Real, Internação.Procedimentos
FROM Paciente
INNER JOIN Internação ON Paciente.ID_Paciente = Internação.ID_Paciente
INNER JOIN Médico ON Internação.ID_Médico = Médico.ID_Médico
INNER JOIN Especialidade ON Médico.Especialidade = Especialidade.Nome
INNER JOIN Quarto ON Internação.ID_Quarto = Quarto.ID_Quarto
WHERE Especialidade.Nome = 'Gastroenterologia' AND Quarto.Tipo_Quarto = 'Enfermaria';

SELECT Médico.Nome, Médico.CRM, COUNT(Consulta.ID_Médico) AS Qtd_Consultas
FROM Médico
LEFT JOIN Consulta ON Médico.ID_Médico = Consulta.ID_Médico
GROUP BY Médico.Nome;

SELECT *
FROM Médico
WHERE Nome LIKE '%Gabriel%';

SELECT Enfermeiro.Nome, Enfermeiro.CRE, COUNT(Internação_Enfermeiro.ID_Internação) AS Qtd_Internações
FROM Enfermeiro
INNER JOIN Internação_Enfermeiro ON Enfermeiro.ID_Enfermeiro = Internação_Enfermeiro.ID_Enfermeiro
GROUP BY Enfermeiro.Nome, Enfermeiro.CRE
HAVING COUNT(Internação_Enfermeiro.ID_Internação) > 1;



CREATE TABLE Internação (
    ID_Internação INT PRIMARY KEY,
    Data_Entrada DATE,
    Data_Alta_Prevista DATE,
    Data_Alta_Real DATE,
    Procedimentos TEXT,
    ID_Quarto INT,
    ID_Paciente INT,
    ID_Médico INT,
    FOREIGN KEY (ID_Quarto) REFERENCES Quarto(ID_Quarto),
    FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente),
    FOREIGN KEY (ID_Médico) REFERENCES Médico(ID_Médico)
);

CREATE TABLE Quarto (
    ID_Quarto INT PRIMARY KEY,
    Tipo_Quarto VARCHAR(50),
    Descrição TEXT,
    Valor_Diário DECIMAL(10, 2)
);

CREATE TABLE Enfermeiro (
    ID_Enfermeiro INT PRIMARY KEY,
    Nome VARCHAR(100),
    CPF VARCHAR(14),
    CRE VARCHAR(20)
);

CREATE TABLE Internação_Enfermeiro (
    ID_Internação INT,
    ID_Enfermeiro INT,
    PRIMARY KEY (ID_Internação, ID_Enfermeiro),
    FOREIGN KEY (ID_Internação) REFERENCES Internação(ID_Internação),
    FOREIGN KEY (ID_Enfermeiro) REFERENCES Enfermeiro(ID_Enfermeiro)
);

ALTER TABLE Internação
ADD FOREIGN KEY (ID_Médico) REFERENCES Médico(ID_Médico),
ADD FOREIGN KEY (ID_Paciente) REFERENCES Paciente(ID_Paciente);

INSERT INTO Médico (Nome, CRM, Especialidade, em_atividade)
VALUES
    ('Dr. João Silva', 'CRM12345', 'Pediatria', TRUE),
    ('Dra. Maria Santos', 'CRM23456', 'Clínica Geral', TRUE),
    ('Dr. José Almeida', 'CRM34567', 'Gastroenterologia', TRUE),
    ('Dra. Ana Oliveira', 'CRM45678', 'Dermatologia', TRUE),
    ('Dr. Carlos Nunes', 'CRM56789', 'Ortopedia', TRUE),
    ('Dra. Laura Costa', 'CRM67890', 'Neurologia', TRUE),
    ('Dr. Ricardo Ferreira', 'CRM78901', 'Cardiologia', TRUE),
    ('Dra. Sofia Mendes', 'CRM89012', 'Oncologia', TRUE),
    ('Dr. André Pinto', 'CRM90123', 'Otorrinolaringologia', TRUE),
    ('Dra. Beatriz Marques', 'CRM01234', 'Endocrinologia', TRUE);

INSERT INTO Especialidade (Nome)
VALUES
    ('Ortopedia'),
    ('Neurologia'),
    ('Cardiologia'),
    ('Oncologia'),
    ('Otorrinolaringologia'),
    ('Endocrinologia');

INSERT INTO Paciente (Nome, Data_Nascimento)
VALUES
    ('Maria Oliveira', '1990-05-15'),
    ('José Santos', '1985-08-25'),
    ('Ana Silva', '2000-01-10'),
    ('Carlos Pereira', '1972-11-30'),
    ('Lúcia Mendes', '1995-03-18'),
    ('Ricardo Almeida', '1980-07-22'),
    ('Beatriz Costa', '2005-09-05'),
    ('Paulo Nunes', '1965-12-12'),
    ('Sofia Marques', '1978-04-20'),
    ('André Fernandes', '1992-06-28'),
    ('Mariana Torres', '1987-10-08'),
    ('Pedro Rodrigues', '2003-02-14'),
    ('Laura Santos', '1970-09-03'),
    ('Gabriel Oliveira', '1998-11-11'),
    ('Clara Fernandes', '2007-07-07');

INSERT INTO Convênio (Nome)
VALUES
    ('Convênio A'),
    ('Convênio B'),
    ('Convênio C'),
    ('Convênio D');

INSERT INTO Quarto (ID_Quarto, Tipo_Quarto, Descrição, Valor_Diário)
VALUES
    (1, 'Tipo 1', 'Descrição 1', 100.00),
    (2, 'Tipo 2', 'Descrição 2', 150.00);

INSERT INTO Internação (ID_Internação, Data_Entrada, Data_Alta_Prevista, Data_Alta_Real, Procedimentos, ID_Quarto, ID_Paciente, ID_Médico)
VALUES
    (1, '2020-05-10', '2020-05-20', '2020-05-18', 'Procedimento 1', 1, 1, 1),
    (2, '2019-08-15', '2019-08-25', '2019-08-23', 'Procedimento 2', 2, 2, 2);

INSERT INTO Enfermeiro (ID_Enfermeiro, Nome, CPF, CRE)
VALUES
    (1, 'Enf. Maria Silva', '111.111.111-11', 'CRE12345'),
    (2, 'Enf. João Santos', '222.222.222-22', 'CRE23456'),
    (3, 'Enf. Ana Oliveira', '333.333.333-33', 'CRE34567'),
    (4, 'Enf. Pedro Almeida', '444.444.444-44', 'CRE45678');

INSERT INTO Internação_Enfermeiro (ID_Internação, ID_Enfermeiro)
VALUES
    (1, 1),
    (1, 2),
    (2, 3),
    (2, 4);


INSERT INTO Internação_Enfermeiro (ID_Internação)

ALTER TABLE Médico
ADD em_atividade BOOLEAN;

UPDATE Médico
SET em_atividade = FALSE
WHERE ID_Médico IN (1, 3);

UPDATE Médico
SET em_atividade = TRUE
WHERE em_atividade IS NULL;
