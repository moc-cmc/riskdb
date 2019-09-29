drop table
	mc_desktops
go

create table
	mc_desktops(
		mc_desktop_id int,
		name varchar(100))
go

create unique index
	u_md
on
	mc_desktops(
		mc_desktop_id)
go

create unique index
	n_md
on
	mc_desktops(
		name)
go


insert into mc_desktops values(1, "Agency Full Access")
insert into mc_desktops values(2, "Agency Client")
insert into mc_desktops values(3, "Prime Full Access")
insert into mc_desktops values(4, "Prime Client")
insert into mc_desktops values(5, "Hybrid Full Access")
go

delete

from
	keys
where
	relation = "mc_desktops"
go

insert into
	keys
values(
	"mc_desktops",
	5)
go
