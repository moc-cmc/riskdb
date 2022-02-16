
if object_id("upd_user_phone_providers") != NULL
    drop trigger
        upd_user_phone_providers
go

create trigger
    upd_user_phone_providers
on
    user_phone_providers
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_providers: update "
        + convert(varchar(10), a.user_phone_provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
