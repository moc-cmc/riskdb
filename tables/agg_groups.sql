drop table agg_groups
go

create table
	agg_groups(
		agg_group_id int,
		name varchar(50),
		agg_schedule_id int ,
                tally_user_id int,
		tally_trade_type_id int,
		tally_internal_account_id int,
		tally_external_account_id int,
		tally_counterparty_id int,
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

create unique nonclustered index
	u_cg
on
	agg_groups(agg_group_id)
go

create unique nonclustered index 
        u_cgn
on
        agg_groups(name)
go 

insert into keys values("agg_groups", 1)
go
		
