
if object_id("client_give_ups") != NULL
    drop table
        client_give_ups
go

create table
    client_give_ups (
        external_account_id int,
        source_id int,
        symbol varchar(25)
    )
go
