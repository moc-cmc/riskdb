drop table equity_value_dates
go


create table
	equity_value_dates
(
	contract_id int, 
	value_date datetime,
	last_updated datetime
)

go

create unique nonclustered index 
	u_evd 
on 
	equity_value_dates(contract_id)
go
