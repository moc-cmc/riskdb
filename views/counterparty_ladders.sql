
if object_id("counterparty_ladders") != NULL
    drop view
        counterparty_ladders
go

create view
	counterparty_ladders
as
select
	a.counterparty_id,
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
	a.value_date >= convert(datetime, convert(date, dateadd(hour, 7, getdate())))
group by
	a.counterparty_id,
	d.product_id,
	a.value_date
go
