
if object_id("counterparty_balance_details") != NULL
    drop view
        counterparty_balance_details
go

create view
    counterparty_balance_details
as
select
    counterparty = convert(varchar(25), c.name),
    product = convert(varchar(8), b.symbol),
    a.amount,
    equiv = a.amount * e.rate
from
    counterparty_balances a
join products b
    on a.product_id = b.product_id
join counterparties c
    on a.counterparty_id = c.counterparty_id
join counterparty_limits d
    on a.counterparty_id = d.counterparty_id
join currency_rates e
    on a.product_id = e.product_id
    and d.currency_id = e.currency_id

go
