
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
