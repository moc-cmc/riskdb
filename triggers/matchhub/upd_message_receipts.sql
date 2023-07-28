
if object_id("upd_message_receipts") != NULL
    drop trigger
        upd_message_receipts
go

create trigger
    upd_message_receipts
on
    message_receipts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_receipts: update "
        + convert(varchar(10), a.message_receipt_id) + " "
        + convert(varchar(10), a.message_id) + " "
        + convert(varchar(10), a.user_address_id) + " "
        + convert(varchar(10), a.message_receipt_status_id) + " "
        + "'" + convert(varchar(19), a.status_date, 23) + "." + substring(convert(varchar(15), a.status_date, 20), 10, 3) + "' "
        + (case when a.identifier = NULL then "NULL" else "'" + str_replace(a.identifier, "'", "\'") + "'" end) + " "
        + (case when a.error = NULL then "NULL" else "'" + str_replace(a.error, "'", "\'") + "'" end)
    )
from
    inserted a

go
