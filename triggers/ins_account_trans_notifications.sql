
if object_id("ins_account_trans_notifications") != NULL
    drop trigger
        ins_account_trans_notifications
go

create trigger
	ins_account_trans_notifications
on
	account_trans_notifications
for
	insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999, 
            "Notify /topic/Store.Notify." + @@servername + "." + db_name() + "."
            + "account_trans_notifications: insert " 
            + convert(varchar(10), account_trans_notification_id) + " " 
            + convert(varchar(10), source_id) + " " 
            + convert(varchar(10), account_transaction_id) + " " 
            + convert(varchar(10), status_id) + " " 
            + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), capture_date), 9)) + "' " 
            + "'"+ rtrim(convert(varchar(30), dateadd(mi, datediff(mi, getdate(), getutcdate()), notify_date), 9)) + "'" 
    )
from
    inserted

go
