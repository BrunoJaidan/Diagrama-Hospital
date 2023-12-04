# Atividade PROA - Hospital

<h1> Hospital Fundamental - Diagrama</h1>
<h5><a>Um pequeno hospital local busca desenvolver um novo sistema que atenda melhor às suas necessidades. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas espera-se que esses dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, é necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um Diagrama Entidade-Relacionamento.</a></h5>

<center> <img src="https://github.com/BrunoJaidan/Diagrama-Hospital/blob/main/Hospital%20DER.PNG" alt="Imagem 1" width="900"> </center>

<h1> PARTE 2</h1>
<h4> Entidades/Modelagem de Dados:</h4>
Internação

ID_Internação (PK)
Data_Entrada
Data_Alta_Prevista
Data_Alta_Real
Procedimentos
ID_Quarto (FK)
ID_Paciente (FK)
ID_Médico (FK)
Quarto

ID_Quarto (PK)
Tipo_Quarto
Descrição
Valor_Diário
Enfermeiro

ID_Enfermeiro (PK)
Nome
CPF
CRE
Internação_Enfermeiro (tabela de relacionamento)
ID_Internação (PK, FK)
ID_Enfermeiro (PK, FK)

Relacionamentos:
Internação está vinculada a Quarto, Paciente e Médico.
Enfermeiro está associado a Internação através da tabela de relacionamento Internação_Enfermeiro.
Agora, vamos criar o script SQL para a geração do banco de dados com as tabelas e relacionamentos: Está na pasta.

<h1>PARTE 3</h1>

## Objetivo

Os scripts fornecidos visam criar dados de exemplo para simular um ambiente hospitalar. Eles são destinados a demonstrar a estrutura e funcionalidades do banco de dados.

## Scripts de Povoamento

### Médicos e Especialidades

Inclui ao menos dez médicos de diferentes especialidades, com destaque para pediatria, clínica geral, gastrenterologia e dermatologia.

### Especialidades

Popula a tabela de especialidades com ao menos sete tipos diferentes.

### Pacientes

Registra informações de pelo menos 15 pacientes para fins de demonstração.

### Consultas

Registra 20 consultas de diferentes pacientes e médicos, ocorridas entre 01/01/2015 e 01/01/2022. Pelo menos dez consultas contêm receituário com dois ou mais medicamentos.

### Convênios Médicos

Inclui dados de pelo menos quatro convênios médicos e os associa a no mínimo cinco pacientes e cinco consultas.

### Relacionamento entre Médico e Especialidade

Cria a entidade de relacionamento entre médico e especialidade para mapear as especialidades de cada médico.

### Relacionamento entre Internação e Enfermeiro

Estabelece a entidade de relacionamento entre internação e enfermeiro para associar enfermeiros a cada internação.

### Chave Estrangeira do Relacionamento Convênio-Médico

Realiza ajustes na chave estrangeira para garantir integridade referencial no relacionamento entre convênio e médico.

### Internações

Registra ao menos sete internações, algumas realizadas por pacientes que se internaram mais de uma vez. Associa internações a pacientes, médicos e enfermeiros.

### Quartos

Cadastra ao menos três tipos de quarto (apartamento, quarto duplo e enfermaria) com valores distintos.

### Profissionais de Enfermaria

Adiciona informações de dez profissionais de enfermaria e associa cada internação a pelo menos dois enfermeiros.

### Dados Essenciais

Inclui dados iniciais de tipo de quarto, convênio e especialidade para o correto funcionamento do sistema após a instalação.

Os scripts devem ser executados na ordem indicada para garantir a integridade referencial e a correta associação entre os dados.

Para mais informações sobre cada script, consulte o conteúdo dos arquivos SQL neste repositório.

<h1>PARTE 4</h1>

Alterações no Banco de Dados
Adição da Coluna "em_atividade" para Médicos
Foi adicionada uma nova coluna chamada em_atividade à tabela Médico para indicar se o médico está ativo no hospital ou não.

<h1>PARTE 5</h1>

Este diretório contém um conjunto de consultas SQL para um projeto hospitalar. 

### Consultas

1. **Consultas do Ano de 2020 e Sob Convênio:** Retorna os dados e o valor médio das consultas do ano de 2020 e das consultas feitas sob convênio.

2. **Internações com Data de Alta Maior que a Prevista:** Apresenta todos os dados das internações que tiveram a data de alta maior que a data prevista.

3. **Receituário da Primeira Consulta com Receituário Associado:** Retorna o receituário completo da primeira consulta registrada com receituário associado.

4. **Consulta de Maior e Menor Valor:** Apresenta todos os dados da consulta de maior e menor valor, ambas não realizadas sob convênio.

5. **Detalhes das Internações e Cálculo do Valor Total:** Retorna todos os dados das internações em seus respectivos quartos, calculando o valor total da internação a partir do valor de diária do quarto e do número de dias entre a entrada e a alta.

6. **Internações em Quartos do Tipo “Apartamento”:** Retorna a data, procedimento e número de quarto de internações em quartos do tipo “apartamento”.

7. **Consultas de Pacientes Menores de 18 Anos e Não Pediatria:** Apresenta o nome do paciente, data da consulta e especialidade de todas as consultas em que os pacientes eram menores de 18 anos na data da consulta e cuja especialidade não é “pediatria”, ordenando por data de realização da consulta.

8. **Internações por Médicos de Gastroenterologia em Enfermaria:** Retorna o nome do paciente, nome do médico, data da internação e procedimentos das internações realizadas por médicos da especialidade “gastroenterologia”, que tenham acontecido em “enfermaria”.

9. **Quantidade de Consultas por Médico:** Apresenta os nomes dos médicos, seus CRMs e a quantidade de consultas que cada um realizou.

10. **Médicos com "Gabriel" no Nome:** Retorna todos os médicos que têm "Gabriel" no nome.

11. **Detalhes de Enfermeiros com Mais de Uma Internação:** Apresenta os nomes, CREs e número de internações de enfermeiros que participaram de mais de uma internação.

Para utilizar estas consultas, execute-as no banco de dados. Este repositório contém o banco de dados do projeto hospitalar. 


