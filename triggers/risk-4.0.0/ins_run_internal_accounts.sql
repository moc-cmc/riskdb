
if object_id("ins_run_internal_accounts") != NULL
    drop trigger
        ins_run_internal_accounts
go

create trigger
    ins_run_internal_accounts
on
    run_internal_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_internal_accounts: insert "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.internal_account_id)
    )
from
    inserted a

go
