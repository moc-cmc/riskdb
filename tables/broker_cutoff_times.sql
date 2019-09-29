
if object_id("broker_cutoff_times") != NULL
    drop table
        broker_cutoff_times
go

create table
    broker_cutoff_times (
        broker_cutoff_time_id int,
        broker_id int,
        cutoff_time datetime
    )
go
