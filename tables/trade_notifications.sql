
if object_id("trade_notifications") != NULL
    drop table
        trade_notifications
go

create table
    trade_notifications (
        trade_notification_id numeric(10,0) identity,
        source_id int,
        trade_id int,
        status_id int,
        capture_date datetime,
        notify_date datetime null,
        error varchar(250) null
    )
go
