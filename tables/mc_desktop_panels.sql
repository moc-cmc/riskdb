drop table
	mc_desktop_panels
go

create table
	mc_desktop_panels(
		mc_desktop_panel_id int,
		mc_desktop_id int,
		mc_panel_id int)
go

create unique index
	u_mdp
on
	mc_desktop_panels(
		mc_desktop_panel_id)
go

create unique index
	n_mdp
on
	mc_desktop_panels(
		mc_desktop_id,
		mc_panel_id)
go

delete

from
	keys
where
	relation = "mc_desktop_panels"
go

insert into
	keys
values(
	"mc_desktop_panels",
	0)
go


