drop table
	batch_transactions
go

create table
	batch_transactions(
		batch_transaction_id int,
		batched_by int,
		trade_date datetime,
		external_account_id int,
		batched_date datetime,
		confirmation_date datetime NULL,
		confirm_user_id int NULL)

go

create unique index
	u_bt
on
	batch_transactions(
		batch_transaction_id)
go

create unique index
	n_bt
on
	batch_transactions(
		external_account_id,
		trade_date)
go	

delete

from
        keys
where
        relation = "batch_transactions"

insert into
        keys
values(
        "batch_transactions",
        0)
