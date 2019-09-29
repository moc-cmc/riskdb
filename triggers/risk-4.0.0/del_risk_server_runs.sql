
if object_id("del_risk_server_runs") != NULL
    drop trigger
        del_risk_server_runs
go

create trigger
    del_risk_server_runs
on
    risk_server_runs
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".risk_server_runs: delete "
        + convert(varchar(10), a.run_id)
    )
from
    deleted a

go
