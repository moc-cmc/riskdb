
drop table
	queued_rolls
go

create table
	queued_rolls(
		queued_roll_id int,
		batch_id int,
		trade_date datetime,
		account varchar(50),
		near_quantity numeric(30,4), 
		far_quantity numeric(30,4),
		dealt_currency varchar(50),
		counter_currency varchar(50),
		near_date datetime,
		near_price float,
		far_date datetime,
		far_price float)
go


create unique index
	u_qr
on
	queued_rolls(
		queued_roll_id)
go

delete

from
	keys
where
	relation = "queued_rolls"

go

insert into
	keys
values(
	"queued_rolls",
	0)
go

