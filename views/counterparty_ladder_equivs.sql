
if object_id("counterparty_ladder_equivs") != NULL
    drop view
        counterparty_ladder_equivs
go

create view
    counterparty_ladder_equivs
as
select
    counterparty_id = a.counterparty_id,
    value_date = a.value_date,
    equiv = sum(abs(a.amount * c.rate))
from
    counterparty_ladders a
    join counterparty_limits b
        on
            a.counterparty_id = b.counterparty_id
    join currency_rates c
        on
            a.product_id = c.product_id
        and
            b.currency_id = c.currency_id
group by
    a.counterparty_id,
    a.value_date

go
