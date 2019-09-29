drop table
	future_price_factors
go

create table
	future_price_factors(
		future_id int,
		source_id int,
		factor float)
go

create unique index
	u_fpf
on
	future_price_factors(
		future_id,
		source_id)
go
