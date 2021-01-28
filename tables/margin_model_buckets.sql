
create table
	margin_model_buckets (
		margin_model_id int,
		margin_bucket_id int,
    ordering int
  )
go

create unique nonclustered index 
	u_mmb
on
	margin_model_buckets(
    margin_model_id, 
    margin_bucket_id
  )
go

