
drop table
    trade_edits
go

create table
    trade_edits (
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
	timestamp datetime,
	mid_mark float null,
	premium_amount numeric(30, 6) null,
	premium_ccy_id int null,
	premium_date datetime null
    )
go

create nonclustered index ti on trade_edits (trade_id)
go

create nonclustered index ti_d on trade_edits(timestamp)
go



