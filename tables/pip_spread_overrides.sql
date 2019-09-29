
drop table
	pip_spread_overrides
go

create table
	pip_spread_overrides(
		external_account_id int,
		contract_id int,
		pip_spread numeric(30,10))
go


create unique index
	u_pso
on
	pip_spread_overrides(
		external_account_id,
		contract_id)
go


		
