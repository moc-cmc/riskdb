
if object_id("upd_tico_accounts") != NULL
    drop trigger
        upd_tico_accounts
go

create trigger
    upd_tico_accounts
on
    tico_accounts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_accounts: update "
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
