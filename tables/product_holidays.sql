drop table
	product_holidays
go

create table
	product_holidays(
		product_id int,
		holiday_id int,
		date datetime)
go

create unique index
	u_ph
on
	product_holidays(
		product_id,
		holiday_id)
go


delete

from
	keys
where
	relation = "product_holidays"
go

insert into
	keys
values(
	"product_holidays",
	0)
go



