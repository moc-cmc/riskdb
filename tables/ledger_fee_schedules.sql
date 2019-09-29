

if object_id("ledger_fee_schedules") != NULL
    drop table
        ledger_fee_schedules
go

create table
    ledger_fee_schedules(
	ledger_fee_schedule_id int,
	name varchar(50),
	description varchar(200),
	fee_schedule_type_id int,
	fee_transaction_type_id int,
        entered_by int NULL,
        external_account_id int NULL,
        transaction_type_id int NULL,
        currency_id int NULL,
	fee_product_id int,
	fee_price float,
	min_size float NULL,
	direction int,
	book_to_account_id int,
	credit_to_account_id int,
	created_at datetime,
	created_by int)
go

create unique index
	u_lfs
on
	ledger_fee_schedules(
		ledger_fee_schedule_id)
go

delete

from
	keys
where
	relation = "ledger_fee_schedules"

go

insert into
	keys
values(
	"ledger_fee_schedules",
	0)
go


