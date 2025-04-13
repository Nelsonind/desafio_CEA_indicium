with razao_venda as (
    select 
        pk_razao_venda
        ,razao_da_venda
        ,tipo_razao
        ,dt_atualizacao
    from 
        {{ ref('stg_erp__razao_venda') }}
)
, razao_venda_detalhe as (
    select 
        pk_razao_venda_pedido
        ,fk_pedido_venda
        ,fk_razao_venda
        ,dt_atualizacao
    from 
        {{ ref('stg_erp__razao_vendas_pedidos') }}
)
, joined as (
select
    pk_razao_venda_pedido
    ,rv.fk_pedido_venda
    ,rv.fk_razao_venda
    ,r.razao_da_venda    
    ,r.tipo_razao
    ,'{{ run_started_at.strftime("%Y-%m-%d") }}' as dt_atualizacao

    from
        razao_venda as r
    left join razao_venda_detalhe as rv on r.pk_razao_venda=rv.fk_razao_venda

)

select * from joined