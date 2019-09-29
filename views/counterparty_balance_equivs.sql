
if object_id("counterparty_balance_equivs") != NULL
    drop view
        counterparty_balance_equivs
go

create view
    counterparty_balance_equivs
as
select
    counterparty_id = a.counterparty_id,
    a.amount,
    equiv = sum(abs(a.amount * c.rate))
from
    counterparty_balances a
    join counterparty_limits b
        on
            a.counterparty_id = b.counterparty_id
    join currency_rates c
        on
            a.product_id = c.product_id
        and
            b.currency_id = c.currency_id
group by
    a.counterparty_id

go
