if object_id("fee_conversion_rates") != NULL
    drop table
        fee_conversion_rates
go

create table
	fee_conversion_rates(
		fee_conversion_rate_id int,
		contract_id int,
		trade_date datetime,
		price float)
go

create unique index
	u_fcr
on
	fee_conversion_rates(
		fee_conversion_rate_id)
go

create unique index
	n_fcr
on
	fee_conversion_rates(
		contract_id,
		trade_date)
go

delete

from
	keys
where
	relation = "fee_conversion_rates"
go

insert into
	keys
values(
	"fee_conversion_rates",
	0)
go


