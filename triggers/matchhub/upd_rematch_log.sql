
if object_id("upd_rematch_log") != NULL
    drop trigger
        upd_rematch_log
go

create trigger
    upd_rematch_log
on
    rematch_log
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".rematch_log: update "
        + convert(varchar(10), a.rematch_log_id) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "' "
        + convert(varchar(10), a.pre_count) + " "
        + convert(varchar(10), a.post_count) + " "
        + convert(varchar(10), a.status_id)
    )
from
    inserted a

go
