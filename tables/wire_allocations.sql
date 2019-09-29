
drop table
	wire_allocations
go

create table
	wire_allocations(
		pb_wire_signoff_id int,
		external_account_id int,
		confirmation_type_id int,
		amount numeric(30,4))
go

create index
	n_wa
on
	wire_allocations(
		pb_wire_signoff_id)
go
