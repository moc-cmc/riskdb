drop table
	product_transactions
go

create table
	product_transactions(
		product_transaction_id int,
		deal_id int,
		user_id int,
		transaction_type_id int,
		internal_account_id int,
		external_account_id int,
		counterparty_id int,
		quantity numeric(30,4),
		product_id int,
		value_date datetime,
		transaction_date datetime,
		trader_id int,
		strategy_id int,
		status_id int,
		broker_id int,
		identifier varchar(200),
		price float,
		book_to_ext_account_id int)
go

create unique index
	u_pt
on
	product_transactions(
		product_transaction_id)
go

create nonclustered index
	n_e
on
	product_transactions(
		transaction_date)
go

create nonclustered index
	n_ea
on
	product_transactions(
		external_account_id)
go

create nonclustered index
        n_btea
on
        product_transactions(
                book_to_ext_account_id)
go



delete

from
	keys
where
	relation = "product_transactions"
go

insert into
	keys
values(
	"product_transactions",
	0)
go

