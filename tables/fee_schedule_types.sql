drop table fee_schedule_types
go

create table
	fee_schedule_types
(
	fee_schedule_type_id int identity,
	name varchar(25)
)
go

create unique nonclustered index
	u_fs
on
	fee_schedule_types(fee_schedule_type_id)
go

insert into fee_schedule_types values("Volume")
insert into fee_schedule_types values("Ticket Count")
go


