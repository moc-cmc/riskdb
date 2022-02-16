
if object_id("ins_match_statuses") != NULL
    drop trigger
        ins_match_statuses
go

create trigger
    ins_match_statuses
on
    match_statuses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".match_statuses: insert "
        + convert(varchar(10), a.match_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.is_candidate = NULL then "NULL" else "'" + str_replace(a.is_candidate, "'", "\'") + "'" end)
    )
from
    inserted a

go
