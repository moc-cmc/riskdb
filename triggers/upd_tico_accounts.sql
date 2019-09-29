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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_accounts: update "
        + convert(varchar(10), account_id) + " "
        + "'" + rtrim(str_replace(login, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(password, "'", "\'")) + "' "
        + convert(varchar(10), status_id) + " "
        + "'" + rtrim(str_replace(surname, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(given_names, "'", "\'")) + "'"
    )
from
    inserted

go