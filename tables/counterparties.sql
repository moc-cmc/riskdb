
if object_id("counterparties") != NULL
    drop table
        counterparties
go

create table
    counterparties (
        counterparty_id int,
        name char(100),
        external_account_id int
    )
go
