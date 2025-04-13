with fonte_produtos as (
    SELECT 
    cast(PRODUCTID as int) as pk_produtos
    ,cast(NAME as string) as nm_produto
    ,cast(PRODUCTNUMBER as string) as nmr_produto
    ,cast(MAKEFLAG as boolean) as produzido_internamente
    ,cast(FINISHEDGOODSFLAG as boolean) as produto_final
    ,cast(COLOR as string) as cor_produto
    ,cast(SAFETYSTOCKLEVEL as int) as estoque_minimo
    ,cast(REORDERPOINT as string) as ponto_de_reestoque
    ,cast(STANDARDCOST as decimal(18,2)) as preco_padrao_produto
    ,cast(LISTPRICE as decimal(18,2)) as lista_preco_produto
    ,cast(SIZE as string) as tamanho_produto
    ,cast(SIZEUNITMEASURECODE as string) as fk_tamanho_produto
    ,cast(WEIGHTUNITMEASURECODE as string) as fk_peso_produto
    ,cast(WEIGHT as decimal(18,2)) as peso_produto
    ,cast(DAYSTOMANUFACTURE as int) as dias_para_produzir
    ,cast(PRODUCTLINE as string) as linha_produto
    ,cast(CLASS as string) as classe_produto
    ,cast(STYLE as string) as estilo_produto
    ,cast(PRODUCTSUBCATEGORYID as int) as fk_subcategoria_produto
    ,cast(PRODUCTMODELID as int) as fk_modelo_produto
    ,cast(SELLSTARTDATE as date) as dt_inicio_venda
    ,cast(SELLENDDATE as date) as dt_fim_venda
    -- ,cast(DISCONTINUEDDATE as date) as dt_discontinuado
    ,cast(ROWGUID as string) as identificador_do_registro_produto
    ,cast(MODIFIEDDATE as date) as dt_atualizacao
    FROM 
    {{ source('erp', 'product' ) }}
 )
    select * from fonte_produtos