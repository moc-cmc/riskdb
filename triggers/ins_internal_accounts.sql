if object_id("ins_internal_accounts") != NULL
    drop trigger
        ins_internal_accounts
go

create trigger
    ins_internal_accounts
on
    internal_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".internal_accounts: insert "
        + convert(varchar(10), internal_account_id) + " "
        + "'" + rtrim(str_replace(symbol, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(name, "'", "\'")) + "' "
        + convert(varchar(10), default_external_account_id)
    )
from
    inserted

go