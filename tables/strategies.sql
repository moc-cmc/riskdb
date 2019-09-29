
if object_id("strategies") != NULL
    drop table
        strategies
go

create table
    strategies (
        strategy_id int,
        name char(100)
    )
go
