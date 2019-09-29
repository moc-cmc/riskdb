
if object_id("user_runs") != NULL
    drop table
        user_runs
go

create table
    user_runs (
        tico_account_id int,
        run_id int
    )
go

create unique nonclustered index u_ur on user_runs(tico_account_id,run_id)
go
