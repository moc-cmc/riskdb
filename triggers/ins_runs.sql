if object_id("ins_runs") != NULL
    drop trigger
        ins_runs
go

create trigger
    ins_runs
on
    runs
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".runs: insert "
        + convert(varchar(10), run_id) + " "
        + "'" + rtrim(str_replace(name, "'", "\'")) + "'"
    )
from
    inserted

go