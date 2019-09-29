
if object_id("counterparty_nops") != NULL
    drop view
        counterparty_nops
go

create view
    counterparty_nops
as
select
    counterparty_id = a.counterparty_id,
    nop = abs(sum(case 
        when ba.nop_type_id = NULL then
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
        left outer join nop_types ba
            on
                b.nop_type_id = ba.nop_type_id
    left outer join counterparty_balances c
        on
            a.counterparty_id = c.counterparty_id
    join currency_rates d
        on
            c.product_id = d.product_id
        and
            b.currency_id = d.currency_id
group by
    a.counterparty_id

go
