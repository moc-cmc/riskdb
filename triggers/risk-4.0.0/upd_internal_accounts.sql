
if object_id("upd_internal_accounts") != NULL
    drop trigger
        upd_internal_accounts
go

create trigger
    upd_internal_accounts
on
    internal_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".internal_accounts: update "
        + convert(varchar(10), a.internal_account_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.default_external_account_id)
    )
from
    inserted a

go
