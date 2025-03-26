create database meu_banco;
use meu_banco;

create table usuarios (
    id int auto_increment primary key,
    nome varchar(100),
    email varchar(100) unique,
    idade int
);

show tables;

insert into usuarios (nome, email, idade) values 
('Rafael Moreira', 'rafaelonrails@gmail.com', 17),
('Rafael Costa', 'rafaelsenai@gmail.com', 42);

select * from usuarios;
