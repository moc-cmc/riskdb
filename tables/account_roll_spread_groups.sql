drop table account_roll_spread_groups
go

create table
	account_roll_spread_groups(
		external_account_id int,
		roll_spread_group_id int
)
go


create unique nonclustered index 
        u_rsgn
on
        account_roll_spread_groups(external_account_id)
go

