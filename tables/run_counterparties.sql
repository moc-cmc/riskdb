
if object_id("run_counterparties") != NULL
    drop table
        run_counterparties
go

create table
    run_counterparties (
        run_id int,
        counterparty_id int
    )
go
