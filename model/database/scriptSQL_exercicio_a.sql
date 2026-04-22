#permite ver os database existente
show databases;
#cria novo database
create database db_exercicio_a;
create database db_exercicio_a_manha;
#apagar database
drop database db_exercicio_a;
#permite ativar database a ser utilizado
use db_exercicio_a_manha;
#permite ver as tabelas exixtentes dentro de um database
show tables;
#criar tabela
create table tbl_sexo (
id int not null primary key auto_increment,
sigla varchar(3) not null,
nome varchar(20) not null
);
#permite ver a estrutura da tabela
desc tbl_sexo;
describe tbl_sexo;

#Criando a tabela de estado
create table tbl_estado (
	id 		int not null auto_increment primary key,
    sigla 	varchar (3) not null,
    nome 	varchar (30) not null
);

#Criando a tabela tipo telefone
create table tbl_tipo_telefone (
	id 		int not null auto_increment primary key,
    tipo	varchar (15) not null
);

#Criando a tabela categoria 
create table tbl_categoria (
	id int not null auto_increment primary key,
    nome varchar (5) not null
);

show tables;

# COMANDOS DE ALTER TABLE

# Adiciona u novo atributo
alter table tbl_categoria
	add column categoria varchar (20) not null;
    
# Modifica a estrutura de um atributo
alter table tbl_categoria
	modify column categoria varchar (200) not null;

# Permite renomear a escrita do atributo e modificar a sua estrutura    
alter table tbl_categoria
	change column categoria status_categoria int;

# Permite apagar um atributo da tabela     
alter table tbl_categoria 
	drop column status_categoria;

# Criando a tabela de cliente com FK da tabela do sexo
create table tbl_cliente (
	id				int not null auto_increment primary key,
    nome 			varchar (100) not null,
    cpf 			varchar (18) not null,
    data_nascimento date,
    email 			varchar (256),
    id_sexo			int not null,
    
    ## Para fazer uma relação entre duas tabelas ###
    constraint FK_SEXO_CLENTE #Nome do relacionamento
    foreign key (id_sexo)	  #Quem será a fk na tabela
    references tbl_sexo(id)	  #De onde vem a FK
    
);    

# Criando a tabela de telefone
create table tbl_telefone (
	id int not null auto_increment primary key,
    numero varchar (25) not null,
    id_tipo_telefone int not null,
    id_cliente int not null,
    
    ## Relacionamento  entre tipo_telefone e telefone
    constraint FK_TIPOTELEFONE_TELEFONE
    foreign key (id_tipo_telefone)
    references tbl_tipo_telefone(id),
    
    ## Relacionamento entre Cliente e Telefone
    constraint FK_CLIENTE_TELEFONE
    foreign key (id_cliente)
    references tbl_cliente(id)
    
);

#Criando a tabela de cidade 
create table tbl_cidade (
	id int not null auto_increment primary key,
    nome varchar (50) not null
);

#Aler table para adicionar um novo atributo e a FK 
alter table tbl_cidade 
	add column id_estado int not null,
    add constraint FK_ESTADO_CIDADE
    foreign key (id_estado)
    references tbl_cidade(id);

#Para apagar um atributo que está relacionado com outra tabela 
#Primeiro precisa remover a constraint (FK), depois remover,
#o atributo
	alter table tbl_cidade
		drop foreign key FK_ESTADO_CIDADE;

	
	alter table tbl_cidade 
		drop column id_estado;


show tables;    

desc tbl_cidade;


    