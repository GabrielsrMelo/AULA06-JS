use db_filmes_20261_a;

#Retorna a data atual do servidor 
select curdate() as data_atual;
select current_date() as data_atual;

#Retorna a hora atual do servidor 
select current_time() as hora_atual;
select curtime() as hora_atual;

#Retorna a data e a hora atual do servidor 
select current_timestamp() as data_hora_atual;

#### COMANDOS PARA FORATAÇÃO DE DATA E HORA ####
select time_format(curtime(), '%H') as hora;### Hora de 0 ... 23
select time_format('21:50', '%h') as hora;	### Hora de 0 ... 12				
select time_format(curtime(), '%i') as minuto;
select time_format(curtime(), '%s') as segundo;

select time_format(curtime(), '%h:%i') as hora_minuto;

#Retorna AM ou PM
select time_format(curtime(), '%r') as hora_formatada;

select time_format(curtime(), '%T') as hora_formatada; #Formato 24horas

#Funções de Hora 
select hour(curtime()) as hora;
select minute(current_time()) as minuto;
select second(curtime()) as segundos;

#FORMATAÇÃO DE DATA

#Retorna o dia da semana referente a data(Por extenso)
select date_format(current_date(), '%W') as data_formatada;

#Retorna o dia da semana em formato numeral
select date_format(current_date(), '%w') as data_formatada;

#Retorna o dia da semana abreviado (de 3 digitos)
select date_format(current_date(), '%a') as data_formatada;

#Retorna o mês referente a data por extenso
select date_format(current_date(), '%M') as data_formatada;

#Retorna o mês referente a data em numeral
select date_format(current_date(), '%m') as data_formatada;

#Retorna o mês referente a data por extenso abreviado (3 digitos)
select date_format('2026-10-10', '%b') as data_formatada;

#Retorna o dia
select date_format(current_date(), '%d') as data_formatada;
select date_format(current_date(), '%D') as data_formatada; #Formato Ordinal
select date_format(current_date(), '%e') as data_formatada;

#Retorna o numeral referente ao dia perante o ano (1 .. 365)
select date_format(current_date(), '%j') as data_formatada;

#Retorna o numeral referente a qtde de semana 


#Retorna o mês
select date_format(current_date(), '%m') as data_formatada;

#Retorna o ano (00 ou 0000)
select date_format(current_date(), '%y') as data_formatada;
select date_format(current_date(), '%Y') as data_formatada;

#Retorna a data completa com formatos diferentes
select date_format(current_date(), '%d/%m/%Y') as data_formatada;

select id, nome, sinopse, data_lancamento,
		date_format(data_lancamento, '%d/%m/%Y') as data_formatada
	from tbl_filme;
    
#Funções para retornar dia, mês e ano 
select day(current_date()) as data_formatada;
select month(current_date()) as data_formatada;
select year(current_date()) as data_formatada;

#Funções para calculo
select timediff('08:30:00', current_time()) as diferenca;

select (datediff('2026:05-10', '2026-05-13')*-1) as diferenca;