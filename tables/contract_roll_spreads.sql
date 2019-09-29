drop table contract_roll_spreads
go

create table
	contract_roll_spreads(
		roll_spread_group_id int,
		contract_id int,
		spread float
)
go

create unique nonclustered index 
	u_rsg
on
	contract_roll_spreads(roll_spread_group_id, contract_id)
go



