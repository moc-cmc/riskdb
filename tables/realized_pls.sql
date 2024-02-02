drop table
	realized_pls
go

create table
	realized_pls(
		realized_pl_id int,
		trade_date datetime,
		external_account_id int,
		contract_id int,
		longs float  NULL,
		avg_long float NULL,
		short float NULL,
		avg_short float NULL,
		open_pos float NULL,
		close_price float NULL,
		realized_pl float NULL,
		unrealized_pl float NULL)
go

create unique index
	u_rp
on
	realized_pls(
		realized_pl_id)
go

create unique index
	n_rp
on
	realized_pls(
		trade_date,
		external_account_id,
		contract_id)
go

delete

from
	keys
where
	relation = "realized_pls"
go

insert into
	keys
values(
	"realized_pls",
	0)

go
