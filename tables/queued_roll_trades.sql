if object_id("queued_roll_trades") != null
    drop table
        queued_roll_trades
go

create table
    queued_roll_trades (
	queued_roll_trade_id int identity,
	product_id int,
	mkt_user_id int null,
	cl_user_id int null,
        internal_account_id int null,
        external_account_id int null,
        counterparty_id int null,
        quantity numeric(30,4),
        far_quantity numeric(30,4),
        contract_id int,
        price float,
	far_price float,
        value_date datetime,
	far_value_date datetime,
        trade_date datetime,
        trader_id int null,
        strategy_id int null,
        status_id int null,
        broker_id int null,
        identifier varchar(100) null,
        pct_price numeric(30,6) null,
        spot_reference float null,
	premium_settle_date datetime null,
	premium_currency_id int null,
	premium numeric(30, 6) null
    )

go
