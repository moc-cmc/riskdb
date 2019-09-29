
if object_id("ins_ledger_request_logs") != NULL
    drop trigger
        ins_ledger_request_logs
go

create trigger
    ins_ledger_request_logs
on
    ledger_request_logs
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".ledger_request_logs: insert "
        + convert(varchar(10), a.ledger_request_log_id) + " "
        + convert(varchar(10), a.ledger_request_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "' "
        + convert(varchar(10), a.status_id)
    )
from
    inserted a

go
