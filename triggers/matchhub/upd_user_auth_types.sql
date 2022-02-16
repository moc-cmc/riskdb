
if object_id("upd_user_auth_types") != NULL
    drop trigger
        upd_user_auth_types
go

create trigger
    upd_user_auth_types
on
    user_auth_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_auth_types: update "
        + convert(varchar(10), a.user_auth_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
