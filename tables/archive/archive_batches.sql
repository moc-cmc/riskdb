create table
	archive_batches(
		archive_batch_id int,
		archive_date_id int,
		start_date datetime NULL,
		end_date datetime NULL
)
go

create unique nonclustered index 
	u_i
on
	archive_batches(archive_batch_id)

create nonclustered index 
	u_ib
on
	archive_batches(archive_date_id, archive_batch_id)
go

insert into
	keys
values(
	"archive_batches",
	1
)
go
	
