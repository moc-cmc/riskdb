
if object_id("del_message_receipts") != NULL
    drop trigger
        del_message_receipts
go

create trigger
    del_message_receipts
on
    message_receipts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_receipts: delete "
        + convert(varchar(10), a.message_receipt_id) + " "
        + convert(varchar(10), a.message_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.message_receipt_status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.status_date), 9) + "'"
    )
from
    deleted a

go
