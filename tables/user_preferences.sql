
if object_id("user_preferences") != NULL
    drop table
        user_preferences
go

create table
    user_preferences (
        ti_account_id int,
        refresh_rate int
    )
go
