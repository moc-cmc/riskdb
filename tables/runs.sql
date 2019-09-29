
if object_id("runs") != NULL
    drop table
        runs
go

create table
    runs (
        run_id int,
        name char(200)
    )
go
