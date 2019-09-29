
if object_id("ext_account_balance_details") != NULL
    drop view
        ext_account_balance_details
go

create view
    ext_account_balance_details
as
select
    ext_account = convert(varchar(25), c.name),
    product = convert(varchar(8), b.symbol),
    a.amount,
    equiv = a.amount * e.rate
from
    ext_account_balances a
join products b
    on a.product_id = b.product_id
join external_accounts c
    on a.external_account_id = c.external_account_id
join ext_account_limits d
    on a.external_account_id = d.external_account_id
join currency_rates e
    on a.product_id = e.product_id
    and d.currency_id = e.currency_id

go
