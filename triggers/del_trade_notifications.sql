if object_id("del_trade_notifications") != NULL
    drop trigger
        del_trade_notifications
go

create trigger
    del_trade_notifications
on
    trade_notifications
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_notifications: delete "
        + convert(varchar(50), trade_notification_id) + " "
        + convert(varchar(10), source_id) + " "
        + convert(varchar(10), trade_id) + " "
        + convert(varchar(10), status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), capture_date), 9) + "' "
        + (case when notify_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), notify_date), 9) + "'" end) + " "
        + (case when error = NULL then "NULL" else "'" + str_replace(error, "'", "\'") + "'" end)
    )
from
    deleted

go