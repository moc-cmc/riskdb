
if object_id("message_groups") != NULL
    drop table
        message_groups
go

/* table deprecated */

delete from keys where relation = "message_groups"
go

