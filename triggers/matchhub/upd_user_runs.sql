
if object_id("upd_user_runs") != NULL
    drop trigger
        upd_user_runs
go

create trigger
    upd_user_runs
on
    user_runs
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_runs: update "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.run_id)
    )
from
    inserted a

go
