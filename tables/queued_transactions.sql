create table
	queued_transactions(
		queued_transaction_id int,
		tico_account_id int,
		batch_id int,
		entered_by int,
		external_account_id int,
		transaction_type_id int,
		transaction_date datetime,
		currency_id int,
		amount float,
		note varchar(255) NULL,
		balance float NULL,
		rate float NULL,
		days float NULL)
go

delete

from
	keys
where
	relation = "queued_transactions"
go

insert into
	keys
values(
	"queued_transactions",
	0)
go

	
