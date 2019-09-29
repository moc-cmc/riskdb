drop table closed_account_transactions
go

create table
	closed_account_transactions
(
	account_transaction_id int,
	entered_by int,
	external_account_id int,
	transaction_type_id int,
	transaction_date datetime,
	currency_id int,
	amount float,
	note char(255) NULL
)
go

create unique nonclustered index
	u_cat
on
	closed_account_transactions(account_transaction_id)
go

create nonclustered index
	n_cat
on
	closed_account_transactions(external_account_id)
go

create nonclustered index 
        n_catd
on
        closed_account_transactions(transaction_date)
go



