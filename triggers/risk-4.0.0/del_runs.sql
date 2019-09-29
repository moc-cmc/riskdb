
if object_id("del_runs") != NULL
    drop trigger
        del_runs
go

create trigger
    del_runs
on
    runs
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".runs: delete "
        + convert(varchar(10), a.run_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
