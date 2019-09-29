
drop table
	defined_resid_rates
go

create table	
	defined_resid_rates(
		defined_resid_rate_id int,
		contract_id int NULL,
		value_date datetime NULL,
		rate float NULL)
		
go

create unique index
	u_drr
on
	defined_resid_rates(
		defined_resid_rate_id)
go

create unique index
	n_drr
on
	defined_resid_rates(
		contract_id,
		value_date)

delete

from
	keys
where
	relation = "defined_resid_rates"
go

insert into
	keys
values(
	"defined_resid_rates",
	0)
go
