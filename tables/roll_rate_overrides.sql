
drop table
	roll_rate_overrides
go

create table	
	roll_rate_overrides(
		roll_rate_override_id int,
		tico_account_id int,
		contract_id int,
		trade_date datetime NULL,
		closing_date datetime NULL,
		closing_rate_long float NULL,
		closing_rate_short float NULL,
		roll_date datetime NULL,
		roll_rate_long float NULL,
		roll_rate_short float NULL,
		timestamp datetime)
go

create unique index
	u_drr
on
	roll_rate_overrides(
			roll_rate_override_id)
go

create unique index
	n_drr
on
	roll_rate_overrides(
		contract_id,
		closing_date)

delete

from
	keys
where
	relation = "roll_rate_overrides"
go

insert into
	keys
values(
	"roll_rate_overrides",
	0)
go
