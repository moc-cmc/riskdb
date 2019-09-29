
if object_id("external_account_aliases") != NULL
    drop table
        external_account_aliases
go

create table
    external_account_aliases (
        external_account_id int,
        source_id int,
        symbol varchar(100)
    )
go
