create table
    match_notifications (
        match_notification_id numeric(12,0) identity,
        source_id int,
        trade_match_id int,
        status_id int,
        capture_date datetime,
        notify_date datetime null,
        error varchar(250) null
    )
go

alter table match_notifications lock datarows
go

create unique nonclustered index
    u_tn
on
    match_notifications (
        match_notification_id
    )

create unique nonclustered index
    st_tn
on
    match_notifications (
        source_id,
        trade_match_id
    )
go
