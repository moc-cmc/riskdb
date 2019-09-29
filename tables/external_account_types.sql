
if object_id("external_account_types") != NULL
    drop table
        external_account_types
go

create table
    external_account_types (
        external_account_type_id numeric(10,0) identity,
        name varchar(25)
    )
go
