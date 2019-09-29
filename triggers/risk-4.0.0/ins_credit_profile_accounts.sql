
if object_id("ins_credit_profile_accounts") != NULL
    drop trigger
        ins_credit_profile_accounts
go

create trigger
    ins_credit_profile_accounts
on
    credit_profile_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_accounts: insert "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(10), a.external_account_id)
    )
from
    inserted a

go
