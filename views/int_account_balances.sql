
if object_id("int_account_balances") != NULL
    drop view
        int_account_balances
go

create view
	int_account_balances
as
select
	a.internal_account_id,
	d.product_id,
	a.value_date,
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
	forwards c,
	products d
where
	a.contract_id = c.contract_id
and (
		c.currency_id = d.product_id
	or
		c.product_id = d.product_id
	)
and
	a.value_date >= convert(datetime, convert(char(10), getdate(), 101))
group by
	a.internal_account_id,
	d.product_id,
	a.value_date
go
