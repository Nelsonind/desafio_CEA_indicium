/* Não levar informação sensível para o analitico*/


with fonte_pessoa as (
    SELECT 
        cast(BUSINESSENTITYID as string) as pk_pessoas
        ,cast(PERSONTYPE as string) as tp_pessoa
        ,cast(TITLE as string) as pronome_tratamento
        ,cast(FIRSTNAME as string) as primeiro_nome
        ,cast(MIDDLENAME as string) as nome_intermediario
        ,cast(LASTNAME as string) as sobrenome
        ,cast(EMAILPROMOTION as int) as tp_estrategia_email
        -- cast(SUFFIX as string) as
        -- cast(NAMESTYLE as string) as
        -- cast(ADDITIONALCONTACTINFO as ) as
        -- cast(DEMOGRAPHICS as ) as
        -- cast(ROWGUID as ) as
        -- cast(MODIFIEDDATE as ) as
    FROM 
    {{ source('erp', 'person') }}
)
    select * from fonte_pessoa