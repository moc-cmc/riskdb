
if object_id("counterparty_dsls") != NULL
    drop view
        counterparty_dsls
go

create view
    counterparty_dsls
as
select
    a.counterparty_id,
    c.value_date,
    dsl = abs(sum(case 
        when ba.dsl_type_id = NULL then
            NULL
        when ba.incl_base_ccy = "N" and b.currency_id = c.product_id then
            0
        when ba.incl_shorts = "Y" and c.amount < 0 then
            c.amount * d.rate
        when ba.incl_longs = "Y" and c.amount > 0 then
            c.amount * d.rate
        else
            0
    end))
from
    counterparties a
    join counterparty_limits b
        on
            a.counterparty_id = b.counterparty_id
        left outer join dsl_types ba
            on
                b.dsl_type_id = ba.dsl_type_id
    left outer join counterparty_ladders c
        on
            a.counterparty_id = c.counterparty_id
    join currency_rates d
        on
            c.product_id = d.product_id
        and
            b.currency_id = d.currency_id
group by
    a.counterparty_id,
    c.value_date

go
