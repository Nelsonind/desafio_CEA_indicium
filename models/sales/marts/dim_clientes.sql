/*	Primary type of person: SC = Store Contact
    , IN = Individual (retail) customer
    , SP = Sales person
    , EM = Employee (non-sales)
    , VC = Vendor contact
    , GC = General contact */

with staging_pessoas as (
    SELECT 
            cast(BUSINESSENTITYID as string) as pk_pessoas
            ,case 
                when tp_pessoa="IN" then "Cliente individual (varejo)"
                when tp_pessoa="SP" then "Vendedor"
                when tp_pessoa="EM" then "Empregado (nao vendas)"
                when tp_pessoa="VC" then "Contato do fornecedor"
                when tp_pessoa="GC" then "Contato geral"
            else tp_pessoa
            end as tp_pessoas
            ,pronome_tratamento
            ,concat(primeiro_nome," ",nome_intermediario," ",sobrenome) as nm_pessoa
            ,tp_estrategia_email
    from
        {{ ref('stg_erp__pessoas') }}
)
staging_clientes as (
    select 
        ,pk_clientes
        ,fk_pessoas
        ,fk_lojas
        ,fk_territorio
    from
        {{ ref('stg_erp__clientes') }}
)
joined as (
    select
        staging_pessoas.pk_pessoas
        ,staging_clientes.fk_pessoas
        ,staging_clientes.fk_lojas
        ,staging_clientes.fk_territorio
        ,staging_pessoas.tp_pessoas
        ,staging_pessoas.pronome_tratamento
        ,staging_pessoas.nm_pessoa
        ,staging_pessoas.tp_estrategia_email
        ,'{{ run_started_at.strftime("%Y-%m-%d") }}' as dt_atualizacao
    from 
        staging_pessoas
    left join 
        staging_clientes
    on pk_pessoas=fk_pessoas
)
select * from joined