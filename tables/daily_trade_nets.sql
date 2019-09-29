drop table daily_trade_nets
go

create table
	daily_trade_nets(
		daily_trade_net_id int identity,
		trade_date datetime,
		trade_type_id int,
 		internal_account_id int,
 		external_account_id int,
 		counterparty_id int,
 		contract_id int,
 		value_date datetime,
 		fixing_date datetime NULL,
 		trader_id int,
 		strategy_id int,
 		broker_id int,
 		sales_code_id int,
		direction int,
		quantity numeric(30, 4),
		avg_price float,
		trade_count int,
		volume numeric(30, 4) NULL,
                volume_adjustment numeric(30, 4) NULL,
		adjusted_count int NULL
	)
go

create unique nonclustered index 
	dtn_u
on
	daily_trade_nets(daily_trade_net_id)
go

create nonclustered index
	dnt_ut
on
	daily_trade_nets(trade_date)
go

create nonclustered index 
	dnt_ea
on
	daily_trade_nets(external_account_id)
go

create nonclustered index 
        dnt_cp
on
        daily_trade_nets(counterparty_id)
go

create nonclustered index
        dnt_br
on
        daily_trade_nets(broker_id)
go



