use Clinica;

-- LIST II --

-- EX. 01 -- 
select * from paciente;
update paciente set cidade = "Ilhota" where nome = "Paulo";

-- EX. 02 --
select * from consulta;
insert into consulta value(1, 4, "2024-06-25", "10:30:00");	-- inserts a new consulting into Consulta table --
update consulta set horaConsulta = time("12:00:00"), dataConsulta = date("2024-07-04") where codMedico = 1 and codPaciente = 4;


-- EX. 03 --
select * from paciente;
update paciente set idade = idade + 1, doenca = "Câncer" where nome = "Ana"; 

-- ALGEBRA RELACIONAL -- 
select * from paciente;		-- shows all data in table Paciente --
select * from paciente where idade > 29; -- shows all data in Paciente table where 'idade' is bigger than 29 --
select cpf, nome from paciente; -- shows all CPF´s and NOMEs registered in Paciente table --
select cpf, nome from paciente where idade > 29; -- shows all CPF´s abd NOMEs registered in Paciente table where 'idade' is bigger than 29 --

/*	NOTES
-- OPERADORES ARITMÉTICOS (+, -, *, /, ...) --
-- OPERADORES RELACIONAIS (>, >=, ==, <, <= ...) --

-- FUNÇÕES DE AGREGAÇÃO --
-- COUNT (realiza contagens) --
-- MAX/MIN (retorna valores máximos e minimos) --
-- SUM (soma valores) --
-- AVG (Média de valores) --
*/

-- BUSCAR TODAS AS ESPECIALIDADES MÉDICAS DA CLÍNICA --
select especialidade from medico; -- show all data registered in 'especialidade' att. inside Medico table --
select distinct especialidade from medico; -- show all distinct data registered in 'especialidade' att. inside Medico table --

-- QUANTOS GRUPOS DE 5 LEITOS PODEM SER FORMADOS EM CADA AMBULATÓRIO? --
select * from ambulatorio;
select numAmbulatorio, CONCAT(ROUND(capacidade/5), ' grupos') as grupo5Leitos from ambulatorio; 

-- QUAL O SALÁRIO LÍQUIDO DOS FUNCIONÁRIOS SABENDO QUE HÁ UM DESCONTO DE 10% --
describe funcionario;
select * from funcionario;
select nome, cpf, CONCAT("$", salario) as salario, CONCAT("$", (salario-(salario*0.1))) as salarioComDesconto from funcionario;

-- INFORMAR O TOTAL DE MÉDICOS ORTOPEDISTAS DA CLINICA --
select * from medico where especialidade = "Ortopedia";	-- shows all registers in Medico with 'especialidade' = "Ortopedia" --
select COUNT(*) as ortopedistas from medico where especialidade = "Ortopedia";	-- shows the amount of registers in Medico with 'especialidade' = "Ortopedia" --

-- NÚMERO DE FUNCIONÁRIOS COM O SALÁRIO ACIMA DE $1000 --
select * from funcionario where salario > 1000;
select count(*) as funcionariosComSalarioAcimaDe1000 from funcionario where salario > 1000; 

select min(salario) as sal_menor, max(salario) as maior_sal from funcionario where idade > 35;

-- quais são as especialidades distintas entre os médicos --

select count(distinct especialidade) as qtd_esp_med from medico;

-- clausula where -- 
-- buscar o cpf e o nome dos médicos que tem inicial M --


select cpf, nome from medicos where nome like 'M%'; 

-- buscar os nomes dos pacientes cujo cpf termine com 20000 ou 30000