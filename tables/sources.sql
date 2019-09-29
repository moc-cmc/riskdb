
if object_id("sources") != NULL
    drop table
        sources
go

create table
    sources (
        source_id int,
        name char(100),
        status_id int
    )
go
