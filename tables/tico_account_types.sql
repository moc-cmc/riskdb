drop table tico_account_types
go

create table
	tico_account_types
(
		tico_account_id int,
		login_type_id int
)

create unique nonclustered index
	u_n
on
	tico_account_types(tico_account_id)
go



