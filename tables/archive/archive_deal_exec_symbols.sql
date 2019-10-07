
create table
    archive_deal_exec_symbols (
	archive_batch_id int,
        deal_id int,
        symbol varchar(100)
    )
go

create unique nonclustered index
	pk
on
	archive_deal_exec_symbols(deal_id)
go

	
