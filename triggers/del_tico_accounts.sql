if object_id("del_tico_accounts") != NULL
    drop trigger
        del_tico_accounts
go

create trigger
    del_tico_accounts
on
    tico_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_accounts: delete "
        + convert(varchar(10), account_id) + " "
        + "'" + rtrim(str_replace(login, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(password, "'", "\'")) + "' "
        + convert(varchar(10), status_id) + " "
        + "'" + rtrim(str_replace(surname, "'", "\'")) + "' "
        + "'" + rtrim(str_replace(given_names, "'", "\'")) + "'"
    )
from
    deleted

go