
drop table
	trader_spread_overrides
go

create table
	trader_spread_overrides(
		trader_id int,
		contract_id int,
		pip_spread numeric(30,10))
go


create unique index
	u_tso
on
	trader_spread_overrides(
		trader_id,
		contract_id)
go


		
