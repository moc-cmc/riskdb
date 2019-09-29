if object_id("ins_user_runs") != NULL
    drop trigger
        ins_user_runs
go

create trigger
    ins_user_runs
on
    user_runs
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_runs: insert "
        + convert(varchar(10), tico_account_id) + " "
        + convert(varchar(10), run_id)
    )
from
    inserted

go