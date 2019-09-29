
drop table
	defined_roll_rates
go

create table	
	defined_roll_rates(
		defined_roll_rate_id int,
		tico_account_id int,
		contract_id int,
		trade_date datetime NULL,
		closing_date datetime NULL,
		net_long numeric(30,4) NULL,
		long_pbs int NULL,
		closing_rate_long float NULL,
		net_short numeric(30,4) NULL,
		short_pbs int NULL,
		closing_rate_short float NULL,
		roll_date datetime NULL,
		roll_rate_long float NULL,
		roll_rate_short float NULL,
		timestamp datetime)
go

create unique index
	u_drr
on
	defined_roll_rates(
			defined_roll_rate_id)
go

create unique index
	n_drr
on
	defined_roll_rates(
		contract_id,
		closing_date)

delete

from
	keys
where
	relation = "defined_roll_rates"
go

insert into
	keys
values(
	"defined_roll_rates",
	0)
go
