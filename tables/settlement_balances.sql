drop table settlement_balances
go

create table
	settlement_balances
(
	sb_id int,
	account_transaction_id int,
	external_account_id int,
	transaction_date datetime,
	product_id int,
	amount float,
	converted_amount float,
	conversion_rate float
)

create unique nonclustered index
	u_sb
on
	settlement_balances(sb_id)
go

create unique nonclustered index
	n_sb
on
	settlement_balances(account_transaction_id, product_id)
go


