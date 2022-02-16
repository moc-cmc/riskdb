
if object_id("ins_allocation_requests") != NULL
    drop trigger
        ins_allocation_requests
go

create trigger
    ins_allocation_requests
on
    allocation_requests
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".allocation_requests: insert "
        + convert(varchar(10), a.allocation_request_id) + " "
        + convert(varchar(10), a.requestor_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.fo_sub_account_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.amount) + " "
        + "'" + convert(varchar(19), a.request_date, 23) + "." + substring(convert(varchar(15), a.request_date, 20), 10, 3) + "' "
        + (case when a.respond_timestamp = NULL then "NULL" else "'" + convert(varchar(19), a.respond_timestamp, 23) + "." + substring(convert(varchar(15), a.respond_timestamp, 20), 10, 3) + "'" end) + " "
        + (case when a.respond_message = NULL then "NULL" else "'" + str_replace(a.respond_message, "'", "\'") + "'" end)
    )
from
    inserted a

go
