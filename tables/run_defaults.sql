
if object_id("run_defaults") != NULL
    drop table
        run_defaults
go

create table
    run_defaults (
        run_id int,
        evaluation_currency_id int,
        source_id int
    )
go
