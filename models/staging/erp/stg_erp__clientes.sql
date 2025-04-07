/* Não levar informação sensível para o analitico*/

with fonte_clientes as (
    SELECT 
        ,cast(CUSTOMERID as int) as pk_clientes
        ,cast(PERSONID as int) as fk_pessoas
        ,cast(STOREID as int) as fk_lojas
        ,cast(TERRITORYID as int) as fk_territorio
        -- ,cast(ROWGUID as ) as 
        -- ,cast(MODIFIEDDATE as ) as 
    FROM 
    {{ source('erp', 'customer') }}
)
    select * from fonte_clientes