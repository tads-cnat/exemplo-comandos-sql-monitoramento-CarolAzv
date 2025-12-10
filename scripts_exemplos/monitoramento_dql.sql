select concat(nome, '-', estado) as "Cidade-Estado" from dbo.cidade;

select * from dbo.localizacao;

select precip_pluviom, (tempo_max - tempo_min) as variacao,
        dh_coleta::date as dia
    from dbo.tempo
    where precip_pluviom is not null and dia = '2025-01-10';

select * from dbo.central;

select * from dbo.tempocentral;