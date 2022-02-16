
if object_id("upd_session_statuses") != NULL
    drop trigger
        upd_session_statuses
go

create trigger
    upd_session_statuses
on
    session_statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".session_statuses: update "
        + convert(varchar(10), a.session_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + "'" + rtrim(str_replace(a.viable, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.recognized, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.trusted, "'", "\'")) + "'"
    )
from
    inserted a

go
