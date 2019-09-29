drop table
	payment_request_transactions
go

create table
	payment_request_transactions(
		payment_request_id int,
		account_transaction_id int)
go

create unique index
	u_prt
on
	payment_request_transactions(
		payment_request_id,
		account_transaction_id)
go

