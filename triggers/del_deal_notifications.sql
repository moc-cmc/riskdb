if object_id("del_deal_notifications") != NULL
    drop trigger
        del_deal_notifications
go

create trigger
    del_deal_notifications
on
    deal_notifications
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_notifications: delete "
        + convert(varchar(50), deal_notification_id) + " "
        + convert(varchar(10), source_id) + " "
        + convert(varchar(10), deal_id) + " "
        + convert(varchar(10), status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), capture_date), 9) + "' "
        + (case when notify_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), notify_date), 9) + "'" end) + " "
        + (case when error = NULL then "NULL" else "'" + str_replace(error, "'", "\'") + "'" end)
    )
from
    deleted

go