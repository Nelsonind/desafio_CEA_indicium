with fonte_razao_venda as (
    SELECT 
        cast(SALESREASONID as int) as pk_razao
        ,cast(NAME as int) razao_da_venda
        ,cast(REASONTYPE as int) tipo_razao
        ,cast(MODIFIEDDATE as date) dt_atualizacao
    FROM 
    {{ source('erp', 'salesreason') }}
)
    select * from fonte_razao_venda