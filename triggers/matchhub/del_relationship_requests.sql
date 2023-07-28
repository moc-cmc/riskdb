
if object_id("del_relationship_requests") != NULL
    drop trigger
        del_relationship_requests
go

create trigger
    del_relationship_requests
on
    relationship_requests
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".relationship_requests: delete "
        + convert(varchar(10), a.relationship_request_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + convert(varchar(10), a.legal_entity_id) + " "
        + (case when a.requested_date = NULL then "NULL" else "'" + convert(varchar(19), a.requested_date, 23) + "." + substring(convert(varchar(15), a.requested_date, 20), 10, 3) + "'" end) + " "
        + (case when a.requested_by = NULL then "NULL" else convert(varchar(10), a.requested_by) end) + " "
        + (case when a.accepted_date = NULL then "NULL" else "'" + convert(varchar(19), a.accepted_date, 23) + "." + substring(convert(varchar(15), a.accepted_date, 20), 10, 3) + "'" end) + " "
        + (case when a.accepted_by = NULL then "NULL" else convert(varchar(10), a.accepted_by) end)
    )
from
    deleted a

go
