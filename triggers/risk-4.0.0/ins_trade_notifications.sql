
if object_id("ins_trade_notifications") != NULL
    drop trigger
        ins_trade_notifications
go

create trigger
    ins_trade_notifications
on
    trade_notifications
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_notifications: insert "
        + convert(varchar(50), a.trade_notification_id) + " "
        + convert(varchar(10), a.source_id) + " "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.capture_date), 9) + "' "
        + (case when a.notify_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.notify_date), 9) + "'" end) + " "
        + (case when a.error = NULL then "NULL" else "'" + str_replace(a.error, "'", "\'") + "'" end)
    )
from
    inserted a

go
