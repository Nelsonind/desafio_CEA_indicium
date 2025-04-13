/* Não levar informação sensível para o analitico*/

with fonte_tipo_envio as (
    SELECT 
        cast(CREDITCARDID as int) as pk_cartao_cred
        ,cast(CARDTYPE as string) as tp_cartao
        -- ,cast(CARDNUMBER as ) as nmr_cartao
        -- ,cast(EXPMONTH as ) as dt_ano_validade
        -- ,cast(EXPYEAR as ) as dt_mes_validade
    FROM 
    {{ source('erp', 'creditcard') }}
)
    select * from fonte_tipo_envio