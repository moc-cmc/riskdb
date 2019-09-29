
if object_id("ext_account_balance_equivs") != NULL
    drop view
        ext_account_balance_equivs
go

create view
    ext_account_balance_equivs
as
select
    external_account_id = a.external_account_id,
    a.amount,
    equiv = sum(abs(a.amount * c.rate))
from
    ext_account_balances a
    join ext_account_limits b
        on
            a.external_account_id = b.external_account_id
    join currency_rates c
        on
            a.product_id = c.product_id
        and
            b.currency_id = c.currency_id
group by
    a.external_account_id

go
