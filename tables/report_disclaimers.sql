drop table report_disclaimers
go


create table 
	report_disclaimers
(
	disclaimer_id int identity,
	name varchar(50),
	disclaimer text
)
go

create unique nonclustered index
	u_ip
on
	report_disclaimers(name)
go





