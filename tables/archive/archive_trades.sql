if exists(select name from sysobjects where id = object_id("archive_trades"))
begin
	if not exists( select name from syscolumns where id = object_id("archive_trades") and name = "archive_batch_id")
        begin
		select 'renaming archive_trades'
		exec
			sp_rename 
				@objname="archive_trades",
				@newname="archive_tradesold"
	end
end
go

if exists(select name from sysobjects where id = object_id("archive_trades"))
begin
	select
		db=db_name(),
		msg="archive_trades exists"
end
go

create table
	archive_trades (
		archive_batch_id int,
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
	archive_trades(trade_id)
go


