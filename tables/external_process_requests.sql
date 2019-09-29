
if object_id("external_process_requests") != NULL
    drop table
        external_process_requests
go

create table
    external_process_requests (
        external_process_id int,
        requested_by_id int,
        timestamp timestamp null
    )
go
