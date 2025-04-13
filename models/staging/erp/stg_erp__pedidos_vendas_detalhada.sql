with fonte_pedidos_vendas_detalhada as (
    SELECT 
        cast(SALESORDERID as int) as fk_pedido_venda
        ,cast(SALESORDERDETAILID as int) as pk_detalhe_pedido
        ,cast(CARRIERTRACKINGNUMBER as string) as nmr_rastreador_carregador
        ,cast(ORDERQTY as int) as vlr_qtd_pedido
        ,cast(PRODUCTID as int) as fk_produto
        ,cast(SPECIALOFFERID as int) as fk_desconto
        ,cast(UNITPRICE as decimal(18,4)) as vlr_preco_unit
        ,cast(UNITPRICEDISCOUNT as decimal(18,4)) as vlr_disconto_preco_unit
        ,cast(MODIFIEDDATE as date) as dt_atualizacao
        ,cast(ROWGUID as string) as identificador_do_registro_venda_detalhada
    FROM 
    {{ source('erp', 'salesorderdetail') }}
)

    select * from fonte_pedidos_vendas_detalhada