
if object_id("aggregated_trades") != NULL
    drop table
        aggregated_trades
go

create table
    aggregated_trades (
        aggregated_trade_id int identity,
        aggregate_trade_id int null,
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
        spot_reference float null
    )
go
