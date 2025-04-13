with fonte_tipo_envio as (
    SELECT 
        cast(SHIPMETHODID as int) as fk_tipo_entrega
        ,cast(NAME as string) as tp_entrega
        ,cast(SHIPBASE as decimal(18,2)) as vlr_base_entrega
        ,cast(SHIPRATE as decimal(18,2)) as tx_entrega
        ,cast(ROWGUID as string) as identificador_do_registro_tipo_envio
        ,cast(MODIFIEDDATE as date) as dt_atualizacao
    FROM 
    {{ source('erp', 'shipmethod') }}
)
    select * from fonte_tipo_envio