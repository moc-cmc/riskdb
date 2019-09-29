drop table
	forward_price_factors
go

create table
	forward_price_factors(
		contract_id int,
		source_id int,
		factor float)
go

create unique index
	u_fpf
on
	forward_price_factors(
		contract_id,
		source_id)
go
