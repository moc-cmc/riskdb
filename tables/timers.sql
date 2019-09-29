
if object_id("timers") != NULL
    drop table
        timers
go

create table
    timers (
        timer_id numeric(10,0) identity,
        name varchar(75) null,
        next_date datetime,
        interval float,
        iterations int,
        sql varchar(255)
    )
go
