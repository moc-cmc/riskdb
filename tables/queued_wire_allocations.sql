
drop table
	queued_wire_allocations
go

create table
	queued_wire_allocations(
		wire_net_account_id int,
		external_account_id int,
		product_id int,
		value_date datetime,
		confirmation_type_id int,
		amount numeric(30,4))
go

create unique index
	u_qwa
on
	queued_wire_allocations(
		external_account_id,
		product_id,
		confirmation_type_id,
		value_date)


go
