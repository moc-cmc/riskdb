drop table archive_fund_min_ticket_size
go

create table
	archive_fund_min_ticket_size
(
	id int identity,
	fund_id int,
	min_ticket_size numeric(30, 4),
	as_of_date datetime
)
go

create unique nonclustered index
	u_afm
on
	archive_fund_min_ticket_size(id)
go




