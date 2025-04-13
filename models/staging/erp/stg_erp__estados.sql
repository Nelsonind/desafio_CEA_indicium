with fontes_estados as (
    SELECT
        cast(STATEPROVINCEID as int) as pk_estados
        ,cast(STATEPROVINCECODE as string) as sigla_estados
        ,cast(COUNTRYREGIONCODE as string) as fk_cod_paises
        ,cast(ISONLYSTATEPROVINCEFLAG as boolean) as eh_somente_estado
        ,cast(NAME as string) as nm_estado
        ,cast(TERRITORYID as int) as fk_territorio
        ,cast(ROWGUID as string) as identificador_do_registro_estado
        ,cast(MODIFIEDDATE as date) as dt_atualizacao
    FROM
    {{ source('erp', 'stateprovince') }}
)

SELECT * FROM fontes_estados