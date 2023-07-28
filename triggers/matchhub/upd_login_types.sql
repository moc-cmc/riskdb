
if object_id("upd_login_types") != NULL
    drop trigger
        upd_login_types
go

create trigger
    upd_login_types
on
    login_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".login_types: update "
        + convert(varchar(10), a.login_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.suffix = NULL then "NULL" else "'" + str_replace(a.suffix, "'", "\'") + "'" end) + " "
        + (case when a.limit = NULL then "NULL" else convert(varchar(10), a.limit) end) + " "
        + (case when a.mc_desktop_id = NULL then "NULL" else convert(varchar(10), a.mc_desktop_id) end) + " "
        + (case when a.login_template = NULL then "NULL" else "'" + str_replace(a.login_template, "'", "\'") + "'" end)
    )
from
    inserted a

go
