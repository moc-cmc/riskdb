
if object_id("ins_ledger_request_types") != NULL
    drop trigger
        ins_ledger_request_types
go

create trigger
    ins_ledger_request_types
on
    ledger_request_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".ledger_request_types: insert "
        + convert(varchar(10), a.ledger_request_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.create_pending_status_id) + " "
        + convert(varchar(10), a.sweep_pending_status_id) + " "
        + convert(varchar(10), a.cancel_pending_status_id)
    )
from
    inserted a

go
