
if object_id("channel_subscriptions") != NULL
    drop table
        channel_subscriptions
go

/* table deprecated */

delete from keys where relation = "channel_subscriptions"
go

