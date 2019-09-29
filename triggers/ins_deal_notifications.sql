
if object_id("ins_deal_notifications") != NULL
    drop trigger
        ins_deal_notifications
go

create trigger
	ins_deal_notifications
on
	deal_notifications
for
	insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999, 
            "Notify /topic/Store.Notify." + @@servername + "." + db_name() + "."
            + "deal_notifications: insert " 
            + convert(varchar(10), deal_notification_id) + " " 
            + convert(varchar(10), source_id) + " " 
            + convert(varchar(10), deal_id) + " " 
            + convert(varchar(10), status_id) + " " 
            + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), capture_date), 9)) + "' " 
            + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), notify_date), 9)) + "' " 
            + "'"+ rtrim(error) + "'"
    )
from
    inserted

go
