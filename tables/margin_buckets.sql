
create table
	margin_buckets (
		margin_bucket_id int,
    nop_model_id int,
    name varchar(100)
  )
go

create unique nonclustered index 
	u_mb
on
	margin_buckets (
    margin_bucket_id
  )
go

create unique nonclustered index 
	n_mb
on
	margin_buckets (
    name
  )
go

insert into keys values("margin_buckets", 6)
go
