
if object_id("ins_user_phone_providers") != NULL
    drop trigger
        ins_user_phone_providers
go

create trigger
    ins_user_phone_providers
on
    user_phone_providers
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phone_providers: insert "
        + convert(varchar(10), a.user_phone_provider_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
