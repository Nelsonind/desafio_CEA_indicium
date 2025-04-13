with stg_enderecos as (
    select
        pk_enderecos
        ,endereco_princial
        ,endereco_secundario
        ,nm_cidade
        ,fk_estados
        ,cod_endereco
        ,localizao
        ,identificador_do_registro_endereco
        ,dt_atualizacao
    from
        {{ ref('stg_erp__enderecos') }}
)
    ,stg_estados as (
        select
            pk_estados
            ,sigla_estados
            ,fk_cod_paises
            ,eh_somente_estado
            ,nm_estado
            ,fk_territorio
            ,identificador_do_registro_estado
            ,dt_atualizacao
        from
            {{ ref('stg_erp__estados') }}
    )
    ,stg_paises as (
        select
            pk_cod_paises
            ,nm_pais
            ,dt_atualizacao
        from
            {{ ref('stg_erp__paises') }}
    )
    select
        concat(pk_enderecos,pk_estados,pk_cod_paises) as pk_localizacao
        ,stg_estados.fk_cod_paises
        ,stg_enderecos.fk_estados
        ,stg_paises.nm_pais
        ,stg_estados.sigla_estados
        ,stg_estados.nm_estado
        ,stg_enderecos.nm_cidade
        ,stg_enderecos.endereco_princial
        ,stg_enderecos.endereco_secundario
        ,stg_enderecos.cod_endereco
        ,stg_enderecos.localizao
        ,'{{ run_started_at.strftime("%Y-%m-%d") }}' as dt_atualizacao
    from 
        stg_enderecos
    left join stg_estados on stg_enderecos.fk_estados=stg_estados.pk_estados
    left join stg_paises on stg_estados.fk_cod_paises=stg_paises.pk_cod_paises