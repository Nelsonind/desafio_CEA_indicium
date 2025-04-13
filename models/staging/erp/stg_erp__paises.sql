with fontes_paises as (
    SELECT
        CAST(COUNTRYREGIONCODE AS string) AS pk_cod_paises
        ,CAST(NAME AS string ) AS nm_pais
        ,CAST(MODIFIEDDATE AS string) AS dt_atualizacao
    FROM
    {{ source('erp', 'countryregion') }}
)

SELECT * FROM fontes_paises