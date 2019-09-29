if object_id("upd_run_internal_accounts") != NULL
    drop trigger
        upd_run_internal_accounts
go

create trigger
    upd_run_internal_accounts
on
    run_internal_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_internal_accounts: update "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), internal_account_id)
    )
from
    inserted

go