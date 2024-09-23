drop table 
	cme_responses
go

create table 
	cme_responses (
		trade_id int,
		response varchar(250))

go

create unique index ut on cme_responses(trade_id)
go

 
