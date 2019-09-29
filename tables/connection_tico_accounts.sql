
create table
    connection_tico_accounts (
        connection_id int,
        tico_account_id int,
    )
go

create unique nonclustered index u_ur on connection_tico_accounts(tico_account_id,connection_id)
go
