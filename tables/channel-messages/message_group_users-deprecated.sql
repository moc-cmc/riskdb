
if object_id("message_group_users") != NULL
    drop table
        message_group_users
go

/* table deprecated */

delete from keys where relation = "message_group_users"
go

