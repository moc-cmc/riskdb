
if object_id("ins_message_receipts") != NULL
    drop trigger
        ins_message_receipts
go

create trigger
    ins_message_receipts
on
    message_receipts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_receipts: insert "
        + convert(varchar(10), a.message_receipt_id) + " "
        + convert(varchar(10), a.message_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.message_receipt_status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.status_date), 9) + "'"
    )
from
    inserted a

go
