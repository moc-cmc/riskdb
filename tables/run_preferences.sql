
if object_id("run_preferences") != NULL
    drop table
        run_preferences
go

create table
    run_preferences (
        ti_account_id int,
        run_id int,
        pl_view_style_id int,
        sorting_style_id int
    )
go
