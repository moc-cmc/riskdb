
if object_id("del_user_phone_providers") != NULL
    drop trigger
        del_user_phone_providers
go

create trigger
    del_user_phone_providers
on
    user_phone_providers
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_providers: delete "
        + convert(varchar(10), a.user_phone_provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
