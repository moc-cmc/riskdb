
if object_id("external_processes") != NULL
    drop table
        external_processes
go

create table
    external_processes (
        external_process_id int,
        name char(100),
        location char(255)
    )
go
