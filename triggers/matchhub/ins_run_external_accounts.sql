
if object_id("ins_run_external_accounts") != NULL
    drop trigger
        ins_run_external_accounts
go

create trigger
    ins_run_external_accounts
on
    run_external_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_external_accounts: insert "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.external_account_id)
    )
from
    inserted a

go
