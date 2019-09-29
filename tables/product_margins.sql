drop table product_margins
go

create table 
	product_margins
(
	product_id int,
	margin float,
	prime_broker_id int
)
go

create unique nonclustered index 
	u_pm
on
	product_margins(product_id, prime_broker_id)
go

