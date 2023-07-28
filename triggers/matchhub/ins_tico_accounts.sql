
if object_id("ins_tico_accounts") != NULL
    drop trigger
        ins_tico_accounts
go

create trigger
    ins_tico_accounts
on
    tico_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_accounts: insert "
        + convert(varchar(10), a.account_id) + " "
        + "'" + rtrim(str_replace(a.login, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.password, "'", "\'")) + "' "
        + convert(varchar(10), a.status_id) + " "
        + "'" + rtrim(str_replace(a.surname, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(a.given_names, "'", "\'")) + "'"
    )
from
    inserted a

go
