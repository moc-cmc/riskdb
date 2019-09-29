
if object_id("dbagents") != NULL
    drop table
        dbagents
go

create table
    dbagents (
        dbagent_id int identity,
        name varchar(25),
        host varchar(25),
        port int
    )
go
