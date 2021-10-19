create table
	matchhub_trades(
		matchhub_trade_id int,
		capture_date datetime,
		status_id int,
		account_id int,
		trader_id int,
		counterparty_id int,
		contract_id int,
		quantity float,
		price float,
		trade_date datetime,
		value_date datetime,
		far_price float NULL,
		far_value_date datetime NULL,
		broker_id int,
		identifier varchar(100),
		confirmed_by int NULL,
		confirmed_at datetime NULL,
		confirm_status_id  int NULL,
		confirm_response_date datetime NULL,
		confirm_message varchar(100) NULL)
lock datarows
go


	

create unique index
	u_mt
on
	matchhub_trades(
		matchhub_trade_id)
go

create unique index
	n_mt
on
	matchhub_trades(
		identifier,
		broker_id)
go

create nonclustered index
        mt_s
on
        matchhub_trades(
		broker_id)
go


delete

from
	keys
where
	relation = "matchhub_trades"
go

insert into
	keys
values(
	"matchhub_trades",
	0)
go

insert into
	tables
values(
	"matchhub_trades",
	"J"
)
go
