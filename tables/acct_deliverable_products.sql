drop table
	acct_deliverable_products
go

create table
	acct_deliverable_products(
		external_account_id int,
		product_id int)
go

create unique index
	u_adp
on
	acct_deliverable_products(
		external_account_id,
		product_id)
go
	
		
		
