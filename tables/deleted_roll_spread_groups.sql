drop table deleted_roll_spread_groups
go

create table
	deleted_roll_spread_groups(
		roll_spread_group_id int,
		name varchar(25),
		deleted_on datetime
)
go

create unique nonclustered index 
	u_rsg
on
	deleted_roll_spread_groups(roll_spread_group_id)
go


go
