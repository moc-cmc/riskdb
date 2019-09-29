
if object_id("upd_credit_profile_accounts") != NULL
    drop trigger
        upd_credit_profile_accounts
go

create trigger
    upd_credit_profile_accounts
on
    credit_profile_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_accounts: update "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(10), a.external_account_id)
    )
from
    inserted a

go
