
if object_id("prime_broker_symbols") != NULL
    drop table
        prime_broker_symbols
go

create table
    prime_broker_symbols (
        prime_broker_id int,
        source_id int,
        symbol varchar(50)
    )
go
