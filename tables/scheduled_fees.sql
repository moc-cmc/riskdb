drop table
	scheduled_fees
go

create table
	scheduled_fees(
		scheduled_fee_id int,
		fee_schedule_id int,
		trade_date datetime)
go


create unique index
	u_sf
on
	scheduled_fees(
		scheduled_fee_id)
go


delete

from
	keys
where
	relation = "scheduled_fees"
go

insert into
	keys
values(
	"scheduled_fees",
	0)
go

