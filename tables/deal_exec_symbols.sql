
if object_id("deal_exec_symbols") != NULL
    drop table
        deal_exec_symbols
go

create table
    deal_exec_symbols (
        deal_id int,
        symbol varchar(100)
    )
go
