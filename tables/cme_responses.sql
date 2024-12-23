drop table 
	cme_responses
go

create table 
	cme_responses (
		trade_id int,
		source_run int NULL,
		response varchar(250),
		sdr_receipt_timestamp varchar(25) NULL,
		timestamp datetime NULL)

go

create unique index ut on cme_responses (trade_id, source_run)
go

 
