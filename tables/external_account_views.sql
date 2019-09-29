
if object_id("external_account_views") != NULL
    drop table
        external_account_views
go

create table
    external_account_views (
        external_account_id int
    )
go
