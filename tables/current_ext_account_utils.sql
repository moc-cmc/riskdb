
if object_id("current_ext_account_utils") != NULL
    drop table
        current_ext_account_utils
go

create table
    current_ext_account_utils (
        external_account_id int,
        date datetime,
        dsl float NULL,
        nop float NULL
    )
go

create unique clustered index
    u_ceau
on
    current_ext_account_utils(
        external_account_id
    )

go
