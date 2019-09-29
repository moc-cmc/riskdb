
if object_id("run_futures") != NULL
    drop table
        run_futures
go

create table
    run_futures (
        run_id int,
        future_id int
    )
go
