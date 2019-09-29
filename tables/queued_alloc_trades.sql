
if object_id("queued_alloc_trades") != NULL
    drop table
        queued_alloc_trades
go

create table
    queued_alloc_trades (
        trade_id int,
        deal_id int,
        user_id int,
        trade_type_id int,
        internal_account_id int,
        external_account_id int,
        counterparty_id int,
        quantity numeric(30,4),
        contract_id int,
        value_date datetime,
        fixing_date datetime null,
        price float,
        trade_date datetime,
        trader_id int,
        strategy_id int,
        status_id int,
        broker_id int,
        sales_code_id int,
        identifier varchar(100),
        pct_price numeric(30,6) null,
        spot_reference float null,
	premium_settle_date datetime null,
	premium_currency_id int null,
	premium numeric(30, 6) null
    )
go
