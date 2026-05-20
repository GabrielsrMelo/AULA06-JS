use db_filmes_20261_a;

show tables;

alter table tbl_classificacao
add column nome varchar(50) not null;

desc tbl_filme_genero;

create table tbl_filme_genero (
	id int not null auto_increment primary key,
    id_filme int not null,
    id_genero int not null,
    
    #relação para filme
    constraint FK_FILME_FILMEGENERO
    foreign key (id_filme)
    references tbl_filme(id),
    
    #Relação para o Genero
    constraint FK_GENERO_FILMEGENERO
    foreign key (id_genero)
    references tbl_genero(id)
    
);

#Adiciona a coluna da FK e Cria a relação com a tabela de classificacao
alter table tbl_filme
	add column id_classificacao int not null,
    add constraint FK_CLASSIFICACAO_FILME
		foreign key (id_classificacao)
        references tbl_classificacao(id);

delete from tbl_filme;

show tables;
desc tbl_classificacao;

insert into tbl_classificacao (sigla, caracteristicas, nome) 
		values ('L',  'Filme de classificação livre', 'Livre' ),
			   ('10', 'conteúdo sensivel para menores de 10 anos', 'Maior de 10 anos');

select * from tbl_classificacao;

insert into tbl_filme (
						nome,
                        data_lancamento,
                        duracao, 
                        sinopse,
                        avaliacao, 
                        valor,
                        capa,
                        id_classificacao
                        )
			    values (
                        'Super Mario Galaxy: O Filme', 
						'2026-04-02', 
                        '01:39:00', 
                        'O bigodudo encanador italiano e seus aliados embarcam numa aventura galáctica
                        repleta de ação e momentos emocionantes depois de salvar o Reino dos Cogumelos.', 
                        '3',
                        '50.70',
                        'https://br.web.img3.acsta.net/c_310_420/img/5b/ea/5bea1aeac3323aeaaf82449a34fafbbf.jpg',
                        1
                        );
                        
                        
select  tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.data_lancamento, tbl_filme.capa, 
		tbl_classificacao.sigla, tbl_classificacao.nome as nome_classificacao
from tbl_filme 
	inner join tbl_classificacao
		on tbl_classificacao.id = tbl_filme.id_classificacao;