
if object_id("del_login_types") != NULL
    drop trigger
        del_login_types
go

create trigger
    del_login_types
on
    login_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".login_types: delete "
        + convert(varchar(10), a.login_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.suffix = NULL then "NULL" else "'" + str_replace(a.suffix, "'", "\'") + "'" end) + " "
        + (case when a.limit = NULL then "NULL" else convert(varchar(10), a.limit) end)
    )
from
    deleted a

go
