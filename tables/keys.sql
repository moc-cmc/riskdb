
if object_id("keys") != NULL
    drop table
        keys
go

create table
    keys (
        relation char(30),
        last_id int
    )
go
