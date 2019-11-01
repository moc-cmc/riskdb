create table
	transfer_prices(
		id int,
		contract_id int,
		value_date datetime,
		date datetime,
		price float)

create unique index
	u_tp
on
	transfer_prices(
		id)
go

create unique index
	n_tp
on
	transfer_prices(
		contract_id,
		value_date,
		date)
go

delete

from
	keys
where
	relation = "transfer_prices"
go

insert into
	keys
values(
	"transfer_prices",
	0)
go

