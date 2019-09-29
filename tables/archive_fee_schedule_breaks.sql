drop table archive_fee_schedule_breaks
go

create table
	archive_fee_schedule_breaks
(
	fee_schedule_break_id int,
        fee_schedule_id int,
	name varchar(50),
	description varchar(200), 
        break_period_id int, 
        start_level float,
	end_level float,
	break_price float NULL,
	direction int,
	created_at datetime,
	created_by int
)
go

create unique nonclustered index
	u_vfs
on
	archive_fee_schedule_breaks(fee_schedule_break_id)
go

create nonclustered index
        r_vfs
on
        archive_fee_schedule_breaks(fee_schedule_id)
go




