
if object_id("ins_message_receipt_statuses") != NULL
    drop trigger
        ins_message_receipt_statuses
go

create trigger
    ins_message_receipt_statuses
on
    message_receipt_statuses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".message_receipt_statuses: insert "
        + convert(varchar(10), a.message_receipt_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
