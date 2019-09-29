
if object_id("upd_activity_statuses") != NULL
    drop trigger
        upd_activity_statuses
go

create trigger
    upd_activity_statuses
on
    activity_statuses
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".activity_statuses: update "
        + convert(varchar(10), a.activity_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
