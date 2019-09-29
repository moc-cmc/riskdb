
if object_id("external_process_status") != NULL
    drop table
        external_process_status
go

create table
    external_process_status (
        external_process_id int,
        status_date datetime,
        description char(100)
    )
go
