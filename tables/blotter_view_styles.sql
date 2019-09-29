
if object_id("blotter_view_styles") != NULL
    drop table
        blotter_view_styles
go

create table
	blotter_view_styles(
		blotter_view_style_id int,
		name varchar(100),
		description varchar(255))
go

create unique index
	u_bvs
on
	blotter_view_styles(
		blotter_view_style_id)
go

create unique index
	n_bvs
on
	blotter_view_styles(
		name)
go

insert into
	blotter_view_styles
values(
	1,
	"Numerator View",
	"Shows Trades as Quantity and Biproduct Symbol")

insert into
	blotter_view_styles
values(
	2,
	"Curr/Counter View",
	"Shows Trades as Curr amount and Counter Amount")

delete

from
	keys
where
	relation = "blotter_view_styles"

insert into 
	keys
values(
	"blotter_view_styles",
	2)
go
