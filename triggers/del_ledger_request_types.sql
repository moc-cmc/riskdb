
if object_id("del_ledger_request_types") != NULL
    drop trigger
        del_ledger_request_types
go

create trigger
    del_ledger_request_types
on
    ledger_request_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".ledger_request_types: delete "
        + convert(varchar(10), a.ledger_request_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.create_pending_status_id) + " "
        + convert(varchar(10), a.sweep_pending_status_id) + " "
        + convert(varchar(10), a.cancel_pending_status_id)
    )
from
    deleted a

go
