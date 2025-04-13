with resumo as (
    select 
    pk_pedido_venda
    ,fk_cliente
    ,fk_vendedor
    ,fk_territorio
    ,fk_end_comprador
    ,fk_end_destinatario
    ,fk_tipo_entrega
    ,fk_cartao_credito
    ,fk_taxa_cambio
    ,nmr_vzs_revisto
    ,eh_compra_online
    ,dt_pedido
    ,dt_entrega
    ,dt_despachada
    ,dt_atualizacao
    ,status
    ,nmr_ordem_pedido
    ,nmr_conta
    ,cod_aprov_cred_card
    ,vlr_subtotal
    ,vlr_imposto
    ,vlr_frete
    ,total_devido
    ,observacao
    ,identificador_do_venda_resumo
    from 
        {{ ref('stg_erp__pedidos_vendas_resumo') }}
    ),
detalhada as (     
    select 
        fk_pedido_venda
         ,pk_detalhe_pedido
         ,nmr_rastreador_carregador
         ,vlr_qtd_pedido
         ,fk_produto
         ,fk_desconto
         ,vlr_preco_unit
         ,vlr_disconto_preco_unit
         ,dt_atualizacao
         ,identificador_do_registro_venda_detalhada
    from 
        {{ ref('stg_erp__pedidos_vendas_detalhada') }}
    )
--Resultado deveria ser $12.646.112,16, sum(vlr_subtotal=12.641.672.2129)
,joined as (
    select 
        concat(fk_pedido_venda,pk_detalhe_pedido) as pk_vendas_detalhadas
        ,d.fk_produto
        ,d.fk_desconto
        ,r.fk_cliente
        ,r.fk_vendedor
        ,r.fk_territorio
        ,r.fk_end_comprador
        ,r.fk_end_destinatario
        ,r.fk_tipo_entrega
        ,r.fk_cartao_credito
        ,r.fk_taxa_cambio
        ,d.nmr_rastreador_carregador
        ,r.status
        ,r.eh_compra_online
        ,r.nmr_ordem_pedido
        ,r.nmr_conta
        ,r.cod_aprov_cred_card
        ,r.nmr_vzs_revisto
        ,r.dt_pedido
        ,r.dt_entrega
        ,r.dt_despachada
        ,d.vlr_qtd_pedido
        ,d.vlr_preco_unit
        ,d.vlr_disconto_preco_unit
        ,r.vlr_imposto
        ,r.vlr_frete
    from 
        resumo r 
    left join detalhada d on r.pk_pedido_venda=d.fk_pedido_venda
)
,metricas as (
    select 
        pk_vendas_detalhadas
        ,vlr_qtd_pedido
        ,(vlr_qtd_pedido*vlr_preco_unit) as vlr_total_negociado
        ,(vlr_preco_unit * vlr_qtd_pedido - (1-(vlr_disconto_preco_unit*vlr_qtd_pedido))) as vlr_total_negociado_liquido
        ,(vlr_imposto/SUM(vlr_qtd_pedido) OVER (PARTITION BY pk_vendas_detalhadas))*vlr_qtd_pedido as vlr_imposto_rateada
        ,(vlr_frete/SUM(vlr_qtd_pedido) OVER (PARTITION BY pk_vendas_detalhadas))*vlr_qtd_pedido as vlr_frete_rateada
    from
        joined
)
,final as (
    select 
        joined.pk_vendas_detalhadas
        ,fk_produto
        ,fk_desconto
        ,fk_cliente
        ,fk_vendedor
        ,fk_territorio
        ,fk_end_comprador
        ,fk_end_destinatario
        ,fk_tipo_entrega
        ,fk_cartao_credito
        ,fk_taxa_cambio
        ,nmr_rastreador_carregador
        ,status
        ,eh_compra_online
        ,nmr_ordem_pedido
        ,nmr_conta
        ,dt_pedido
        ,dt_entrega
        ,dt_despachada
        ,joined.vlr_qtd_pedido
        ,vlr_preco_unit
        ,vlr_disconto_preco_unit
        ,vlr_total_negociado
        ,vlr_total_negociado_liquido
        ,vlr_imposto_rateada
        ,vlr_frete_rateada
    from joined
    left join metricas on joined.pk_vendas_detalhadas=metricas.pk_vendas_detalhadas
)
select * from final