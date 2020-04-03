
create table
    archive_aggregated_trades (
	archive_batch_id int,
	aggregated_trade_id int,
	aggregate_trade_id int,
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

create unique nonclustered index 
	u_at
on
	archive_aggregated_trades(aggregated_trade_id)
go

if not exists(select name from tables where name = "archive_aggregated_trades")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "archive_aggregated_trades",
        "J"
    )
end 
go


