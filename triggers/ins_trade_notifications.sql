
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
            "Notify /topic/Store.Notify." + @@servername + "." + db_name() + "."
            + "trade_notifications: insert " 
            + convert(varchar(10), trade_notification_id) + " " 
            + convert(varchar(10), source_id) + " " 
            + convert(varchar(10), trade_id) + " " 
            + convert(varchar(10), status_id) + " " 
            + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), capture_date), 9)) + "' " 
            + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), notify_date), 9)) + "' " 
            + "'"+ rtrim(error) + "'"
    )
from
    inserted

go
