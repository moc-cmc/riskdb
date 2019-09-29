drop table
	expiration_prices
go

create table
	expiration_prices(
		expiration_name varchar(50),
		contract_id int,
		price float)

go

create unique index
	u_rep
on
	expiration_prices(
		expiration_name,
		contract_id)
go


