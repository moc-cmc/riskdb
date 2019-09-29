
if object_id("del_internal_accounts") != NULL
    drop trigger
        del_internal_accounts
go

create trigger
    del_internal_accounts
on
    internal_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".internal_accounts: delete "
        + convert(varchar(10), a.internal_account_id) + " "
        + "'" + rtrim(str_replace(a.symbol, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.default_external_account_id)
    )
from
    deleted a

go
