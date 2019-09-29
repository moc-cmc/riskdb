drop table agg_group_defaults
go

create table
	agg_group_defaults(
		agg_schedule_id int,
                tally_user_id int,
		tally_trade_type_id int,
		tally_internal_account_id int,
		tally_trader_id int,
		tally_strategy_id int,
		tally_status_id int,
		tally_broker_id int,
		tally_sales_code_id int,
		offset_ext_account_id int NULL,
		offset_counterparty_id int NULL,
		offset_trader_id int NULL
	)
go

		
