
if object_id("run_traders") != NULL
    drop table
        run_traders
go

create table
    run_traders (
        run_id int,
        trader_id int
    )
go
