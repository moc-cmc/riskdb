
if object_id("ins_activity_statuses") != NULL
    drop trigger
        ins_activity_statuses
go

create trigger
    ins_activity_statuses
on
    activity_statuses
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".activity_statuses: insert "
        + convert(varchar(10), a.activity_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
