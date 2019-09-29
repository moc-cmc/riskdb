drop table pb_transfers
go

create table
	pb_transfers(
		pb_transfer_id int,
		from_pb_id int,
		from_pb_ext_acct_id int,
		to_pb_id int,
		to_pb_cpty_id int
)


create unique nonclustered index
	u_pbi
on
	pb_transfers(pb_transfer_id)
go

create unique nonclustered index 
	u_pb
on
	pb_transfers(from_pb_id, to_pb_id)
go

insert into keys values("pb_transfers", 0)
go


