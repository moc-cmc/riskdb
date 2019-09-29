if object_id("del_match_statuses") != NULL
    drop trigger
        del_match_statuses
go

create trigger
    del_match_statuses
on
    match_statuses
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".match_statuses: delete "
        + convert(varchar(10), a.match_status_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
