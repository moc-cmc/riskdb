
if object_id("tico_accounts") != NULL
    drop table
        tico_accounts
go

create table
    tico_accounts (
        account_id int,
        login char(50),
        password char(20),
        status_id int,
        surname char(50),
        given_names char(100)
    )
go
