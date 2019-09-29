
if object_id("ext_account_credits") != NULL
    drop view
        ext_account_credits
go

create view
    ext_account_credits
as
select
    a.external_account_id,
    d.product_id,
    b.value_date,
    amount = sum(
        case
        when c.currency_id = d.product_id then
            a.quantity * a.price * -1.0
        when c.product_id = d.product_id then
            a.quantity
        end
    )
from
    trades a,
    trade_value_dates b,
    forwards c,
    products d
where
    a.trade_id = b.trade_id
and
    a.contract_id = c.contract_id
and (
        c.currency_id = d.product_id
    or
        c.product_id = d.product_id
    )
and
    b.value_date >= convert(datetime, convert(char(10), getdate(), 101))
group by
    a.external_account_id,
    d.product_id,
    b.value_date
go
