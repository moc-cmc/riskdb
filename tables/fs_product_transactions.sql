drop table fs_product_transactions
go

create table 
	fs_product_transactions
(
	fs_product_transaction_id int identity,
	fee_schedule_id int,
	product_transaction_id int,
	trade_id int,
	created_by int,
	created_at datetime
)
go

create unique nonclustered index
	u_fspt
on
	fs_product_transactions(fs_product_transaction_id)
go

create unique nonclustered index
	u_fsti
on
	fs_product_transactions(fee_schedule_id, trade_id)
go


