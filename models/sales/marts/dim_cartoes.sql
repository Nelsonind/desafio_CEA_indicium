with staging as (
    select 
        pk_cartao_cred
        ,tp_cartao
        ,'{{ run_started_at.strftime("%Y-%m-%d") }}' as dt_atualizacao
    from {{ ref('stg_erp__cartoes_credito') }}
)

select * from staging