create table
    archive_deals (
	archive_batch_id int,
        deal_id int,
        deal_type_id int,
        timestamp datetime,
        status_id int,
	exec_symbol varchar(100) NULL
    )
go
