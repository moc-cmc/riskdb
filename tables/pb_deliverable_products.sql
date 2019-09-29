drop table
	pb_deliverable_products
go

create table
	pb_deliverable_products(
		prime_broker_id int,
		product_id int)
go

create unique index
	u_pdp
on
	pb_deliverable_products(
		prime_broker_id,
		product_id)
go
	
		
		
