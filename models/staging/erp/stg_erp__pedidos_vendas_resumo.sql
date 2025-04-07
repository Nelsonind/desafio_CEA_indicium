with fonte_pedidos_vendas_resumo as (
    SELECT 
        cast(SALESORDERID as int) as pk_pedido_venda
        ,cast(CUSTOMERID as int) as fk_cliente
        ,cast(SALESPERSONID as int) as fk_vendedor
        ,cast(TERRITORYID as int) as fk_territorio
        ,cast(BILLTOADDRESSID as int) as fk_end_comprador
        ,cast(SHIPTOADDRESSID as int) as fk_end_destinatario
        ,cast(SHIPMETHODID as int) as fk_tipo_entrega
        ,cast(CREDITCARDID as int) as fk_cartao_credito
        ,cast(CURRENCYRATEID as int) as fk_taxa_cambio
        ,cast(REVISIONNUMBER as int) as nmr_vzs_revisto
        ,cast(ONLINEORDERFLAG as bool) as eh_compra_online
        ,cast(ORDERDATE as date) as dt_pedido
        ,cast(DUEDATE as date) as dt_entrega
        ,cast(SHIPDATE as date) as dt_despachada
        ,cast(MODIFIEDDATE as date) as dt_atualizacao
        ,cast(STATUS as int ) as status
        ,cast(PURCHASEORDERNUMBER as int) as nmr_ordem_pedido
        ,cast(ACCOUNTNUMBER as int) as nmr_conta
        ,cast(CREDITCARDAPPROVALCODE as string) as cod_aprov_cred_card
        ,cast(SUBTOTAL as numeric(18,2)) as vlr_subtotal
        ,cast(TAXAMT as numeric(18,4)) as  vlr_imposto
        ,cast(FREIGHT as numeric(18,4)) as vlr_frete
        ,cast(TOTALDUE as numeric(18,4)) as total_devido
        ,cast(COMMENT as string) as observacao
        -- ,cast(ROWGUID as string) as ROWGUID
    FROM 
    {{ source('erp', 'salesorderheader') }}
)

    select * from fonte_pedidos_vendas_resumo