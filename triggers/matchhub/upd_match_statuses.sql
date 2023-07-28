
if object_id("upd_match_statuses") != NULL
    drop trigger
        upd_match_statuses
go

create trigger
    upd_match_statuses
on
    match_statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".match_statuses: update "
        + convert(varchar(10), a.match_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.is_candidate = NULL then "NULL" else "'" + str_replace(a.is_candidate, "'", "\'") + "'" end)
    )
from
    inserted a

go
