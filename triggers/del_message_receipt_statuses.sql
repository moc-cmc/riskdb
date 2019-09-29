
if object_id("del_message_receipt_statuses") != NULL
    drop trigger
        del_message_receipt_statuses
go

create trigger
    del_message_receipt_statuses
on
    message_receipt_statuses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_receipt_statuses: delete "
        + convert(varchar(10), a.message_receipt_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
