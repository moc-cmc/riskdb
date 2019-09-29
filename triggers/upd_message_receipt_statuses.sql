
if object_id("upd_message_receipt_statuses") != NULL
    drop trigger
        upd_message_receipt_statuses
go

create trigger
    upd_message_receipt_statuses
on
    message_receipt_statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_receipt_statuses: update "
        + convert(varchar(10), a.message_receipt_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
