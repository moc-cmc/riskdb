
if object_id("ins_risk_server_runs") != NULL
    drop trigger
        ins_risk_server_runs
go

create trigger
    ins_risk_server_runs
on
    risk_server_runs
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".risk_server_runs: insert "
        + convert(varchar(10), a.run_id)
    )
from
    inserted a

go
