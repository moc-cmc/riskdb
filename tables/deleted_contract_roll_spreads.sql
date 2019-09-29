drop table deleted_contract_roll_spreads
go

create table
	deleted_contract_roll_spreads(
		roll_spread_group_id int,
		contract_id int,
		spread float,
		deleted_at datetime
)
go

create unique nonclustered index 
	u_rsg
on
	deleted_contract_roll_spreads(roll_spread_group_id, contract_id)
go



