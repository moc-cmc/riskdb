
if object_id("deal_notifications") != NULL
    drop table
        deal_notifications
go

create table
    deal_notifications (
        deal_notification_id numeric(10,0) identity,
        source_id int,
        deal_id int,
        status_id int,
        capture_date datetime,
        notify_date datetime null,
        error varchar(250) null
    )
go
