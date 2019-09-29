
if object_id("trade_exec_symbols") != NULL
    drop table
        trade_exec_symbols
go

create table
    trade_exec_symbols (
        trade_id int,
        symbol varchar(100)
    )
go
