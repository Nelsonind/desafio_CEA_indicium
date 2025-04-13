/* Não levar informação sensível para o analitico*/

with fonte_vendedor as (
    SELECT 
        cast(BUSINESSENTITYID as int) as pk_pessoas
        ,cast(TERRITORYID as int) as fk_cod_territorio
        ,cast(SALESQUOTA as int) as vlr_quota_de_venda
        ,cast(BONUS as int) as vlr_bonus
        ,cast(COMMISSIONPCT as decimal(18,4)) as pct_comissao
        ,cast(SALESYTD as decimal(18,4)) as vlr_vendas_no_ano
        ,cast(SALESLASTYEAR as decimal(18,4)) as vlr_vendas_ano_passado
        ,cast(ROWGUID as string) as identificador_do_registro_vendedor
        ,cast(MODIFIEDDATE as date) as dt_atualizacao
    FROM 
    {{ source('erp', 'salesperson') }}
)
    select * from fonte_vendedor