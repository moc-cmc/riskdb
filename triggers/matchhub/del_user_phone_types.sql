
if object_id("del_user_phone_types") != NULL
    drop trigger
        del_user_phone_types
go

create trigger
    del_user_phone_types
on
    user_phone_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_types: delete "
        + convert(varchar(10), a.user_phone_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
