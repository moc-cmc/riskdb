create table
	approval_users(
		tico_account_id int,
		enabled_by int,
		admin_level int NULL,
		timestamp datetime)
go

create unique index
	u_au
on
	approval_users(
		tico_account_id)
go

