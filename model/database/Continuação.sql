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

insert into tbl_filme (nome, data_lancamento, duracao, sinopse, avaliacao, valor, capa, id_classificacao)
values 
(
    'super mario bros. o filme 2', 
    '2026-04-02', 
    '01:39:00', 
    'o bigodudo encanador italiano e seus aliados embarcam numa aventura galáctica repleta de ação e momentos emocionantes depois de salvar o reino dos cogumelos.', 
    '5', 
    '50.70',
    'https://br.web.img3.acsta.net/c_310_420/img/5b/ea/5bea1aeac3323aeaaf82449a34fafbbf.jpg',
    1
),
(
    'divertida mente 2', 
    '2024-06-20', 
    '01:36:00', 
    'o quartel-general da mente de riley está passando por uma demolição repentina para dar lugar a algo totalmente inesperado: novas emoções! a ansiedade chega para bagunçar tudo.', 
    '5',
    '45.00',
    'https://br.web.img3.acsta.net/c_310_420/pictures/24/05/14/23/12/3631936.jpg',
    1
),
(
    'duna: parte 2', 
    '2024-02-29', 
    '02:46:00', 
    'paul atreides se une a chani e aos fremen enquanto busca vingança contra os conspiradores que destruíram sua família. uma jornada espiritual e militar rumo ao destino de arrakis.', 
    '5',
    '60.00',
    'https://br.web.img3.acsta.net/c_310_420/pictures/24/01/29/19/52/4112109.jpg',
    3
),
(
    'homem-aranha: através do aranhaverso', 
    '2023-06-01', 
    '02:20:00', 
    'miles morales está de volta para o próximo capítulo da saga do aranhaverso. ele é catapultado através do multiverso, onde encontra uma equipe de pessoas-aranha encarregadas de proteger sua própria existência.', 
    '4',
    '35.00',
    'https://br.web.img3.acsta.net/c_310_420/pictures/23/04/04/15/45/3843516.jpg',
    2
),
(
    'avatar: o caminho da água', 
    '2022-12-15', 
    '03:12:00', 
    'jake sully e neytiri formaram uma família e fazem de tudo para ficarem juntos. no entanto, eles devem sair de casa e explorar as regiões de pandora quando uma antiga ameaça ressurge.', 
    '4',
    '55.50',
    'https://br.web.img3.acsta.net/c_310_420/pictures/22/11/22/15/34/0628283.jpg',
    2
);
                        
                        
select  tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.data_lancamento, tbl_filme.capa, 
		tbl_classificacao.sigla, tbl_classificacao.nome as nome_classificacao
from tbl_filme 
	inner join tbl_classificacao
		on tbl_classificacao.id = tbl_filme.id_classificacao;


desc tbl_filme;

#################################################################################################

use db_filmes_20261_a;

show tables;

select * from tbl_filme;
select * from tbl_classificacao;
select * from tbl_genero;
select * from tbl_filme_genero;

#Relacionamento entre tabelas
#INNER JOIN
#Retorna somente os dados relacionados entre as duas tabelas(Em comum entre os dois lados)
select tbl_filme.nome, tbl_filme.data_lancamento, tbl_filme.sinopse,
	   tbl_classificacao.sigla 
from tbl_filme
	   inner join tbl_classificacao
			on tbl_classificacao.id = tbl_filme.id_classificacao;
            
#LEFT JOIN
#Retorna os dados relacionados entre as duas tabelas e os dados existentes na tabela da esquerda 
#que não esta relacionado com a tabela da direita
select tbl_filme.nome, tbl_filme.data_lancamento, tbl_filme.sinopse,
	   tbl_classificacao.sigla 
from tbl_classificacao
	   left join tbl_filme
			on tbl_classificacao.id = tbl_filme.id_classificacao;
            
#RIGHT JOIN
#Retorna os dados relacionados entre as duas tabelas e os dados existentes na tabela da direita
#que não esta relacionado com a tabela da esquerda
select tbl_filme.nome, tbl_filme.data_lancamento, tbl_filme.sinopse,
	   tbl_classificacao.sigla 
from tbl_filme
	   right join tbl_classificacao
			on tbl_classificacao.id = tbl_filme.id_classificacao;
            
            
insert into tbl_genero(nome) 
			values ('Drama'),
				   ('Terror'),
				   ('Romance'),
				   ('Comédia'),
				   ('Aventura'),
				   ('Documentário'),
				   ('Suspense');
                   
insert into tbl_filme_genero (id_filme, id_genero)
			values(77, 3),
			      (77, 5),
			      (79, 2),
			      (79, 7),
			      (79, 5),
			      (80, 1),
			      (80, 4),
			      (80, 5);
                  
                  
select tbl_filme.nome as nome_filme, tbl_filme.sinopse, tbl_filme.duracao,
	   tbl_classificacao.sigla, tbl_classificacao.nome as nome_classificacao, tbl_classificacao.descricao as classificacao_indicativa,
       tbl_genero.nome as nome_genero
       
from   tbl_filme
			inner join tbl_classificacao
				on tbl_classificacao.id = tbl_filme.id_classificacao
			left  join tbl_filme_genero
				on tbl_filme.id = tbl_filme_genero.id_filme
			left join tbl_genero
				on tbl_genero.id = tbl_filme_genero.id_genero

where tbl_filme.nome like '%mario%'
			order by tbl_filme.nome asc;
            
            
select * from tbl_filme;
select * from tbl_classificacao where id= 4;
select * from tbl_genero;

#SobConsulta
select * from tbl_filme_genero where id_filme in (
													select tbl_filme.id from tbl_filme
												);