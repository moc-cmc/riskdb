create table
    archive_deals (
	archive_batch_id int,
        deal_id int,
        deal_type_id int,
        timestamp datetime,
        status_id int
    )
go

create nonclustered index
	pk 
on
	archive_deals(deal_id)
go

