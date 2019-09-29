drop table
	cfd_eod_rates
go

create table
	cfd_eod_rates(
		cer_id int,
		contract_id int,
		rate_date datetime,
		status_id int,
		rate float NULL,
		days float NULL,
		exchange_rate float NULL)
go

create unique index
	u_cer
on
	cfd_eod_rates(
		cer_id)
go

create unique index
	n_cer
on
	cfd_eod_rates(
		contract_id,
		rate_date)
go

delete

from
	keys
where
	relation = "cfd_eod_rates"

insert into
	keys
values(
	"cfd_eod_rates",
	0)
go
