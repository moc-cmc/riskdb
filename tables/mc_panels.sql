drop table
	mc_panels
go

create table
	mc_panels(
		mc_panel_id int,
		name varchar(100))
go

create unique index
	u_mp
on
	mc_panels(
		mc_panel_id)
go

create unique index
	n_mp
on
	mc_panels(
		name)
go


insert into mc_panels values(1, "Prices")
insert into mc_panels values(2, "Activity")
insert into mc_panels values(3, "Ladder")
insert into mc_panels values(4, "Credit")
insert into mc_panels values(5, "Deals Editor")
insert into mc_panels values(6, "Expirations")
insert into mc_panels values(7, "Blotter Agency")
insert into mc_panels values(8, "Blotter Client")
insert into mc_panels values(9, "Messages")
insert into mc_panels values(10, "Reports")
insert into mc_panels values(11, "Margin")
insert into mc_panels values(12, "Ladder Client")
insert into mc_panels values(13, "Margin Client")
insert into mc_panels values(14, "MC Lite Advertisement")



delete

from
	keys
where
	relation = "mc_panels"
go

insert into
	keys
values(
	"mc_panels",
	15)
go


