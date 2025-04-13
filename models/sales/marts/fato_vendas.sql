with intermediate as (
    select 
    pk_vendas_detalhadas
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
    ,vlr_qtd_pedido
    ,vlr_preco_unit
    ,vlr_disconto_preco_unit
    ,vlr_total_negociado
    ,vlr_total_negociado_liquido
    ,vlr_imposto_rateada
    ,vlr_frete_rateada
    ,'{{ run_started_at.strftime("%Y-%m-%d") }}' as dt_atualizacao
    from
        {{ ref('int_vendas') }}
)
select * from intermediate