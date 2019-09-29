drop table
	queued_resid_trades
go

create table
	queued_resid_trades(
		queued_resid_id int,
		batch_id int,
		trade_date datetime,
		external_account_id int,
		quantity numeric(30,4), 
		contract_id int,
		value_date datetime,
		price float NULL)
go


create unique index
	u_qr
on
	queued_resid_trades(
		queued_resid_id)
go

delete

from
	keys
where
	relation = "queued_resid_trades"

go

insert into
	keys
values(
	"queued_resid_trades",
	0)
go

