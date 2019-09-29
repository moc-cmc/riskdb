
drop table
	pip_spread_contracts
go

create table
	pip_spread_contracts(
		pip_spread_id int,
		contract_id int,
		pip_spread numeric(30,10))
go


create unique index
	n_psc
on
	pip_spread_contracts(
		pip_spread_id,
		contract_id)
go
