
if object_id("internal_account_views") != NULL
    drop table
        internal_account_views
go

create table
    internal_account_views (
        internal_account_id int
    )
go
