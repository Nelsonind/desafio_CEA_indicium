with staging as (
    select 
        pk_cartao_cred
        ,tp_cartao
    from {{ ref('stg_erp__cartoes_credito') }}
)

select * from staging