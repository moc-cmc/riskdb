drop table
	invoice_transactions
go

create table
	invoice_transactions(
		product_transaction_id int,
		account_transaction_id int)
go

create unique index
	u_it
on
	invoice_transactions(
		product_transaction_id)

create unique index
	n_it
on
	invoice_transactions(
		account_transaction_id)
go
