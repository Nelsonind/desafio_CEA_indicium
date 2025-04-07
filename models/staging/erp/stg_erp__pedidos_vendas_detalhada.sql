with fonte_pedidos_vendas_detalhada as (
    SELECT 
        cast(SALESORDERID as ) as fk_pedido_venda
        ,cast(SALESORDERDETAILID as ) as pk_detalhe_pedido
        ,cast(CARRIERTRACKINGNUMBER as ) as 
        ,cast(ORDERQTY as ) as vlr_qtd_pedido
        ,cast(PRODUCTID as ) as fk_produto
        ,cast(SPECIALOFFERID as ) as fk_desconto
        ,cast(UNITPRICE as ) as vlr_preco_unit
        ,cast(UNITPRICEDISCOUNT as ) as vlr_disconto_preco_unit
        ,cast(MODIFIEDDATE as ) as dt_atualizacao
        -- ,cast(ROWGUID as ) as 
    FROM 
    {{ source('erp', 'salesorderdetail') }}
)

    select * from fonte_pedidos_vendas_detalhada