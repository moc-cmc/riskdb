
if object_id("del_rematch_log") != NULL
    drop trigger
        del_rematch_log
go

create trigger
    del_rematch_log
on
    rematch_log
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".rematch_log: delete "
        + convert(varchar(10), a.rematch_log_id) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "' "
        + convert(varchar(10), a.pre_count) + " "
        + convert(varchar(10), a.post_count) + " "
        + convert(varchar(10), a.status_id)
    )
from
    deleted a

go
