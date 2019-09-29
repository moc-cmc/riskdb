drop table
	mc_desktop_overrides
go

create table
	mc_desktop_overrides(
		tico_account_id int,
		mc_desktop_id int)
go

create unique index
	u_mdo
on
	mc_desktop_overrides(
		tico_account_id,
		mc_desktop_id)
go
