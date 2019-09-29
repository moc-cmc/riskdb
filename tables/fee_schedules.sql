drop table fee_schedules
go

create table
	fee_schedules
(
	fee_schedule_id int identity,
	name varchar(50),
	description varchar(200), 
	fee_schedule_type_id int,
        trade_type_id int NULL,
        internal_account_id int NULL,
        external_account_id int NULL,
        counterparty_id int NULL,
        contract_id int NULL,
        trader_id int NULL,
        strategy_id int NULL,
        status_id int NULL,
        broker_id int NULL,
        sales_code_id int NULL,
	fee_product_id int,
	fee_price float,
	min_ticket_size float,
	direction int,
	created_at datetime,
	created_by int,
	fee_type_id int,
	book_to_ext_account_id int
)
go

create unique nonclustered index
	u_fs
on
	fee_schedules(fee_schedule_id)
go

create nonclustered index
	tt_fs
on
	fee_schedules(trade_type_id)
go

create nonclustered index
        ea_fs
on
        fee_schedules(external_account_id)
go

create nonclustered index
        eab_fs
on
        fee_schedules(book_to_external_account_id)
go




