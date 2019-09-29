
if object_id("run_brokers") != NULL
    drop table
        run_brokers
go

create table
    run_brokers (
        run_id int,
        broker_id int
    )
go
