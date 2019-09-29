
if object_id("del_timers") != NULL
    drop trigger
        del_timers
go

create trigger
    del_timers
on
    timers
for
    delete
as

declare @result int

select
    @result = syb_sendmsg(b.host, b.port,
        "@" + @@servername + "." + db_name() + " notify delete timers "
        + convert(varchar(50), a.timer_id) + " "
        + (case when a.name = NULL then "NULL" else "'" + str_replace(a.name, "'", "\'") + "'" end) + " "
        + "'" + convert(varchar(11), a.next_date, 23) + convert(varchar(12), a.next_date, 20) + "' "
        + convert(varchar(50), a.interval) + " "
        + convert(varchar(10), a.iterations) + " "
        + "'" + str_replace(a.sql, "'", "\'") + "'"
    )
from
    deleted a,
    dbagents b

/* For dataagent */
select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".timers: delete "
        + convert(varchar(50), timer_id) + " "
        + (case when name = NULL then "NULL" else "'" + str_replace(name, "'", "\'") + "'" end) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), next_date), 9) + "' "
        + convert(varchar(50), interval) + " "
        + convert(varchar(10), iterations) + " "
        + "'" + str_replace(sql, "'", "\'") + "'"
    )
from
    deleted

go
