
if object_id("del_activity_statuses") != NULL
    drop trigger
        del_activity_statuses
go

create trigger
    del_activity_statuses
on
    activity_statuses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".activity_statuses: delete "
        + convert(varchar(10), a.activity_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
