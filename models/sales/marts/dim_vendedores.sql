with stg_pessoas as (
    select
        pk_pessoas
        ,tp_pessoa
        ,pronome_tratamento
        ,primeiro_nome
        ,nome_intermediario
        ,sobrenome
        ,tp_estrategia_email
    from 
        {{ ref('stg_erp__pessoas') }}
)
    ,stg_vendedores as (
    select
        pk_pessoas
        ,fk_cod_territorio
        ,vlr_quota_de_venda
        ,vlr_vendas_no_ano
        ,vlr_vendas_ano_passado
    from 
        {{ ref('stg_erp__vendedores') }}
    ),

joined as (
    select
        pk_pessoas
        ,concat(primeiro_nome," ",nome_intermediario) as nm_vendedor
        ,tp_estrategia_email
        ,vlr_quota_de_venda
        ,vlr_vendas_no_ano
        ,vlr_vendas_ano_passado
        ,fk_cod_territorio
        ,'{{ run_started_at.strftime("%Y-%m-%d") }}' as dt_atualizacao
    from 
        stg_vendedores
    left join stg_pessoas on stg_vendedores.pk_pessoas=stg_pessoas.pk_pessoas
)
    select * from joined