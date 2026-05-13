# Cria o database do projeto de filmes 
create database db_filmes_20261_a;

# Ativa o uso do database de filmes
use db_filmes_20261_a;

# Cria a tabela de filme
create table tbl_filme (
	id 				int not null primary key auto_increment,
    nome 			varchar(80) not null,
    data_lancamento date not null,
    duracao 		time not null,
    sinopse 		text not null,
    avaliacao 		decimal(3,2) default null,
    valor 			decimal(5,2) not null default 0,
    capa 			varchar(255)

);

# Mostra a tabela
show tables;

#Inserir dados
insert into tbl_filme (
						nome,
                        data_lancamento,
                        duracao, 
                        sinopse,
                        avaliacao, 
                        valor,
                        capa
                        )
			    values (
                        'Super Mario Galaxy: O Filme', 
						'2026-04-02', 
                        '01:39:00', 
                        'O bigodudo encanador italiano e seus aliados embarcam numa aventura galáctica
                        repleta de ação e momentos emocionantes depois de salvar o Reino dos Cogumelos.', 
                        '3',
                        '50.70',
                        'https://br.web.img3.acsta.net/c_310_420/img/5b/ea/5bea1aeac3323aeaaf82449a34fafbbf.jpg'
                        );
create table tbl_classificacao (
	id 				int not null primary key auto_increment,
    sigla 			varchar(3) not null,
    classificacao 	varchar(250) not null
);

desc tbl_classificacao;

create table tbl_genero (
	id 				int not null primary key auto_increment,
    nome 			varchar(250) not null
);

desc tbl_genero;

create table tbl_sexo (
	id int not null primary key auto_increment,
    sigla varchar(3) not null
);

insert into tbl_sexo(
					  sigla
                      )
				values(
					  'M'
                );
desc tbl_sexo;

select * from tbl_sexo order by id desc

create table tbl_nacionalidade (
	id int not null primary key auto_increment,
    nome varchar(100) not null
);

desc tbl_nacionalidade;





select * from tbl_filme;

drop table tbl_nacionalidade;