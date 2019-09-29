drop table
	account_product_trans_trades
go

create table
	account_product_trans_trades(
		account_transaction_id int,
		trade_id int)

go


create nonclustered index u_a on account_product_trans_trades(account_transaction_id)
go


