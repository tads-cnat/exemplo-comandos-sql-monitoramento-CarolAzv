select concat(nome, '-', estado) as "Cidade-Estado" from dbo.cidade;

select * from dbo.localizacao;

select precip_pluviom, (tempo_max - tempo_min) as variacao,
        dh_coleta::date as dia
    from dbo.tempo
    where precip_pluviom is not null and dia = '2025-01-10';

select * from dbo.central;

select * from dbo.tempocentral;

select * from dbo.tempo
    offset 0 limit 3

select distinct estado from dbo.cidade


select nome, estado from dbo.cidade
    order by estado asc nome asc

select avg(tempo_max) as "média da máxima",
        max(tempo_max) as "maior máxima",
        min(tempo_max) as "menor máxima"
        from dbo.tempo

select estado, count(*) as quantidade
    from dbo.cidade
    group by estado
    having estado in('BA','RN');

(select tempo_max, precip_pluviom from dbo.tempo
    where precip_pluviom is null)

union
(select tempo_max, precip_pluviom from dbo.tempo
    where precip_pluviom >= 3);

select tempo_max, tempo_min from dbo.tempo
    where id_cidade in (
        select id from dbo.cidade
        where estado = 'BA'
    );

select id from dbo.cidade
    where estado = 'BA'

select cid.nome, cid.estado, loc.latitude, loc.longitude
    from dbo.cidade cid CROSS JOIN dbo.localizacao loc
    where cid.id = loc.id_cidade;

/*markdown
Operador Interno (INNER JOIN)
*/

select cid.nome, cid.estado, loc.latitude, loc.longitude
    from dbo.cidade cid INNER JOIN dbo.localizacao loc
    ON (cid.id = loc.id_cidade);

--mais eficiente que cross

alter table dbo.localizacao alter column id_cidade drop not null;

insert into dbo.localizacao (latitude, longitude, id_cidade) 
    (23.67, 54.34, null), (23.67, 55.77, null)

/*markdown
Operador Externo (OUTER JOIN)
*/

/*markdown
Listar as cidades e as suas localizações inclusive as cidades que não possuim localização
*/

select cid.nome, cid.estado, loc.latitude, loc.longitude
    from dbo.cidade cid LEFT OUTER JOIN dbo.localizacao loc
    ON (cid.id = loc.id_cidade);

/*markdown
FULL JOIN
*/

select cid.nome, cid.estado, loc.latitude, loc.longitude
    from dbo.cidade cid FULL JOIN dbo.localizacao loc
    ON (cid.id = loc.id_cidade);