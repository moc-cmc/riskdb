drop table
	scheduled_fee_transactions
go

create table
	scheduled_fee_transactions(
		scheduled_fee_id int,
		account_transaction_id int,
		trade_id int)
go

create unique index
	u_sft
on
	scheduled_fee_transactions(
		scheduled_fee_id,
		account_transaction_id)
go


