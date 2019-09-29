drop table netlink_configs
go

create table
	netlink_configs(
		prime_broker_id int,
		book_offset char(1),
		offset_ext_account_id int NULL,
		offset_counterparty_id int NULL,
		offset_trader_id int NULL,
		deal_groupings char(1) NULL
		
	)
go

create unique nonclustered index
	u_pb
on
	netlink_configs(prime_broker_id)
go



		
