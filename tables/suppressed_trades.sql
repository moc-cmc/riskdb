if object_id("suppressed_trades") != NULL
    drop table
        suppressed_trades
go

create table
    suppressed_trades (
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


create index u_sp on suppressed_trades(trade_id)
go

create index u_di on suppressed_trades(deal_id)
go

if not exists(select relation from keys where relation = "suppressed_trades")
begin
	insert into 
		keys
	values(
		"suppressed_trades",
		0
		)
end
go

