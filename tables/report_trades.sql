
if object_id("report_trades") != NULL
    drop table
        report_trades
go

/* 
    report_trade_id is not an identity because bulk deletes of 
    identity fields causes identity burn, which can take the identity field
    outside the range of an int

    We want the ability to delete and reimport reported trades without worrying about this
*/
	
create table
    report_trades (
        report_trade_id int, /* not an identity */
        report_deal_id int NULL,
        report_commit_id int,
        import_date datetime,
        trade_type_id int,
        external_account_type_id int,
        external_account_id int NULL,
        counterparty_id int,
        quantity numeric(30,4),
        contract_id int,
        value_date datetime,
        fixing_date datetime NULL,
        price float,
        trade_date datetime,
        trader_id int NULL,
        strategy_id int NULL,
        status_id int,
        broker_id int NULL,
        identifier varchar(100),
        pct_price numeric(30,6) NULL,
        spot_reference float NULL,
        /* Extra columns */
        reporter_identifier varchar(100) NULL,
        trade_id int NULL
    )
go

create unique index u_rt on report_trades(report_trade_id)
go

create unique nonclustered index rc_rt on report_trades(report_commit_id, identifier)
go


if not exists(select relation from keys where relation = "report_trades")
begin
	insert into 
			keys 
	values	(
			"report_trades",
			 0
		)
end
go

