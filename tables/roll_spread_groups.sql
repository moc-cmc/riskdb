drop table roll_spread_groups
go

create table
	roll_spread_groups(
		roll_spread_group_id int,
		name varchar(25)
)
go

create unique nonclustered index 
	u_rsg
on
	roll_spread_groups(roll_spread_group_id)
go

create unique nonclustered index 
        u_rsgn
on
        roll_spread_groups(name)
go

insert into
	keys
values(
	"roll_spread_groups",
	0)
go
