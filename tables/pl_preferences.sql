
if object_id("pl_preferences") != NULL
    drop table
        pl_preferences
go

create table
    pl_preferences (
        ti_account_id int,
        pl_view_style_id int,
        sorting_style_id int
    )
go
