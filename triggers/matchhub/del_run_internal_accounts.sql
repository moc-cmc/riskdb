
if object_id("del_run_internal_accounts") != NULL
    drop trigger
        del_run_internal_accounts
go

create trigger
    del_run_internal_accounts
on
    run_internal_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_internal_accounts: delete "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.internal_account_id)
    )
from
    deleted a

go
