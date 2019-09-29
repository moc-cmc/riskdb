
if object_id("fwd_pl_preferences") != NULL
    drop table
        fwd_pl_preferences
go

create table
    fwd_pl_preferences (
        ti_account_id int,
        pl_view_style_id int,
        sorting_style_id int
    )
go
