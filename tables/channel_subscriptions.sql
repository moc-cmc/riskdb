
if object_id("channel_subscriptions") != NULL
    drop table
        channel_subscriptions
go

create table
    channel_subscriptions (
        channel_subscription_id int identity,
        channel_id int,
        item_id int NULL,
        message_recipient_id int,
        priority_id int,
        delay float,
        status_id int /* Pending, Active */
    )
go

