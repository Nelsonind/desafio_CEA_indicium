with fonte_razao_venda as (
    SELECT 
        cast(SALESREASONID as int) as pk_razao_venda
        ,cast(NAME as string) razao_da_venda
        ,cast(REASONTYPE as string) tipo_razao
        ,cast(MODIFIEDDATE as date) dt_atualizacao
    FROM 
    {{ source('erp', 'salesreason') }}
)
    select * from fonte_razao_venda