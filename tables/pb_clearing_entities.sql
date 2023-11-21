drop table
	pb_clearing_entities
go

create table
	pb_clearing_entities(
		prime_broker_id int,
		clearing_pb_id int)
go

create unique index
	u_pce
on
	pb_clearing_entities(
		prime_broker_id,
		clearing_pb_id)
go
