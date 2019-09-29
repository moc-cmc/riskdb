
if object_id("upd_risk_server_runs") != NULL
    drop trigger
        upd_risk_server_runs
go

create trigger
    upd_risk_server_runs
on
    risk_server_runs
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".risk_server_runs: update "
        + convert(varchar(10), a.run_id)
    )
from
    inserted a

go
