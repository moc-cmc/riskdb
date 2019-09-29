
if object_id("option_settledates") != NULL
    drop table
        option_settledates
go

create table
    option_settledates (
        contract_id int,
        settledate datetime
    )
go
