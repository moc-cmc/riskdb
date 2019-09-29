
if object_id("brokers") != NULL
    drop table
        brokers
go

create table
    brokers (
        broker_id int,
        symbol char(25),
        source_id int
    )
go
