drop table
	roll_prices
go

create table
	roll_prices(
		roll_price_id int,
		trade_date datetime,
		contract_id int,
		closing_date datetime,
		roll_date datetime,
		near_price float NULL,
		sell_roll_price float NULL,
		buy_roll_price float NULL,
		timestamp datetime NULL)
go

create unique index
	u_rp
on
	roll_prices(
		roll_price_id)
go

create unique index
	n_rp
on
	roll_prices(
		trade_date,
		contract_id)
go

delete

from
	keys
where
	relation = "roll_prices"
go

insert into
	keys
values(
	"roll_prices",
	0)
go	
