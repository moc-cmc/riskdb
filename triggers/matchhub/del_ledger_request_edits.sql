
if object_id("del_ledger_request_edits") != NULL
    drop trigger
        del_ledger_request_edits
go

create trigger
    del_ledger_request_edits
on
    ledger_request_edits
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".ledger_request_edits: delete "
        + convert(varchar(10), a.ledger_request_id) + " "
        + convert(varchar(10), a.requestor_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.outside_account_id) + " "
        + convert(varchar(10), a.bo_master_account_id) + " "
        + (case when a.custodial_account_id = NULL then "NULL" else convert(varchar(10), a.custodial_account_id) end) + " "
        + convert(varchar(10), a.ledger_request_type_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.amount) + " "
        + "'" + convert(varchar(19), a.transaction_date, 23) + "." + substring(convert(varchar(15), a.transaction_date, 20), 10, 3) + "' "
        + "'" + convert(varchar(19), a.request_date, 23) + "." + substring(convert(varchar(15), a.request_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.edited_by) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "'"
    )
from
    deleted a

go
