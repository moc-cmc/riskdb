
if object_id("default_run_favorites") != NULL
    drop table
        default_run_favorites
go

create table
    default_run_favorites (
	fund_id int,
        run_id int
    )
go

create unique nonclustered index 
	u_drf
on
	default_run_favorites(fund_id, run_id)
go

create nonclustered index 
	n_drf
on
	default_run_favorites(run_id)
go

