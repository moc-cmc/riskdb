drop table
	inverted_settlement_accounts
go

create table
	inverted_settlement_accounts (
		external_account_id int 
)
go

create unique nonclustered index 
	u_ea 
on 
	inverted_settlement_accounts(external_account_id)
go

