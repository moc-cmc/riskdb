
if object_id("upd_runs") != NULL
    drop trigger
        upd_runs
go

create trigger
    upd_runs
on
    runs
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".runs: update "
        + convert(varchar(10), a.run_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
