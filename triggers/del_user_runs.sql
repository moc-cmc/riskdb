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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_runs: delete "
        + convert(varchar(10), tico_account_id) + " "
        + convert(varchar(10), run_id)
    )
from
    deleted

go