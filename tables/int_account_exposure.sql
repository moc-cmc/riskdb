
if object_id("int_account_exposure") != NULL
    drop table
        int_account_exposure
go

create table
    int_account_exposure (
        int_account_exposure_id int,
        entered_by int,
        internal_account_id int,
        transaction_date datetime,
        limit_use float,
        note char(255) null
    )
go
