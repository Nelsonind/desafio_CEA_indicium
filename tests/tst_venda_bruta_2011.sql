/*
Teste para validar os dados financeiros de 2011
Aqui o resultado das vendas brutas no ano de 2011 foram de $12.646.112,16

*/
with valor_bruto as (
    select sum(vlr_total_negociado) as vlr_bruto
    from
        {{ ref('int_vendas') }}
    where 
        dt_pedido between '2011-01-01' and '2011-12-31'
)

select 
    vlr_bruto
from 
    valor_bruto
where vlr_bruto not between 12646112.16 and 12646112.17