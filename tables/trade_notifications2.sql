
if object_id("trade_notifications2") != NULL
    drop procedure
        trade_notifications2
go

create table
    trade_notifications2 (
        trade_notification_id int identity,
        source_id int,
        trade_id int,
        status_id int,
        capture_date datetime,
        notify_date datetime null,
        error varchar(250) NULL
    )
go

create unique index
    u_tn
on
    trade_notifications2 (
        trade_notification_id
    )

create unique clustered index
    st_tn
on
    trade_notifications2 (
        source_id,
        trade_id
    )
go

