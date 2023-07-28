
if object_id("ins_user_phone_types") != NULL
    drop trigger
        ins_user_phone_types
go

create trigger
    ins_user_phone_types
on
    user_phone_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_types: insert "
        + convert(varchar(10), a.user_phone_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
