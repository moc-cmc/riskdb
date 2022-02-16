
if object_id("del_user_runs") != NULL
    drop trigger
        del_user_runs
go

create trigger
    del_user_runs
on
    user_runs
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_runs: delete "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.run_id)
    )
from
    deleted a

go
