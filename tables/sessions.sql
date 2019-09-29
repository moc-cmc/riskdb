
if object_id("sessions") != NULL
    drop table
        sessions
go

create table
    sessions (
        session_id int
    )
go
