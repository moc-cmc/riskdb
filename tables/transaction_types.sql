
if object_id("transaction_types") != NULL
    drop table
        transaction_types
go

create table
    transaction_types (
        transaction_type_id int,
        name char(255),
        direction int
    )
go
