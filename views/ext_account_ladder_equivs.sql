
if object_id("ext_account_ladder_equivs") != NULL
    drop view
        ext_account_ladder_equivs
go

create view
    ext_account_ladder_equivs
as
select
    external_account_id = a.external_account_id,
    value_date = a.value_date,
    equiv = sum(abs(a.amount * c.rate))
from
    ext_account_ladders a
    join ext_account_limits b
        on
            a.external_account_id = b.external_account_id
    join currency_rates c
        on
            a.product_id = c.product_id
        and
            b.currency_id = c.currency_id
group by
    a.external_account_id,
    a.value_date

go
