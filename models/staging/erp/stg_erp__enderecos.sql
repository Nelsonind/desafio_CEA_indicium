with fontes_enderecos as (
    SELECT
        cast(ADDRESSID as int) as pk_enderecos
        ,cast(ADDRESSLINE1 as string) as endereco_princial
        ,cast(ADDRESSLINE2 as string) as endereco_secundario
        ,cast(CITY as string) as nm_cidade
        ,cast(STATEPROVINCEID as int) as fk_estados
        ,cast(POSTALCODE as string) as cod_endereco
        ,cast(SPATIALLOCATION as string) as localizao
        ,cast(ROWGUID as string) as identificador_do_registro_endereco
        ,cast(MODIFIEDDATE as date) as dt_atualizacao
    FROM
    {{ source('erp', 'address') }}
)

SELECT * FROM fontes_enderecos