with fonte as(

    select 
    concat(salesorderid,salesreasonid) as pk_razao_venda_pedido
    ,cast(salesorderid as int) as fk_pedido_venda
    ,cast(salesreasonid as int) as fk_razao_venda
    ,cast(MODIFIEDDATE as date) as dt_atualizacao
    from
    {{ source('erp', 'salesorderheadersalesreason') }}
)

select * from fonte