drop table
	pb_wire_signoffs
go

create table
	pb_wire_signoffs(
		pb_wire_signoff_id int,
		tico_account_id int,
		timestamp datetime,
		external_account_id int,
		confirmation_type_id int,
		product_id int,
		value_date datetime,
		amount numeric(30,4),
		note varchar(200) NULL,
		status_id int)
go

create unique index
	u_pws
on
	pb_wire_signoffs(
		pb_wire_signoff_id)
go


delete

from
	keys
where
	relation = "pb_wire_signoffs"
go

insert into
	keys
values(
	"pb_wire_signoffs",
	0)
go
