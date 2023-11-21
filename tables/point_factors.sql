drop table
	point_factors
go

create table
	point_factors(
		contract_id int,
		point_factor numeric(30,8))
go

create unique index
	u_pf
on
	point_factors(
		contract_id)
go
