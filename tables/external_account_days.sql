
if object_id("external_account_days") != NULL
    drop table
        external_account_days
go

create table
    external_account_days (
        external_account_day_id numeric(10,0) identity,
        trading_day_id int,
        external_account_id int,
        status_id int
    )
go
