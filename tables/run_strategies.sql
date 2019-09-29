
if object_id("run_strategies") != NULL
    drop table
        run_strategies
go

create table
    run_strategies (
        run_id int,
        strategy_id int
    )
go
