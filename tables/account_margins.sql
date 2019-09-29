use
	risk_finotec
go

drop table
	account_margins
go

create table
	account_margins(
		account_margin_id int,
		external_account_id int,
		contract_id int,
		margin float,
		as_of_date datetime)
go

create unique index
	u_dm
on
	account_margins(
		account_margin_id)

go


delete

from
	keys
where
	relation = "account_margins"
go

insert into
	keys
values(
	"account_margins",
	0)
go
