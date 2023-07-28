
if object_id("del_user_phones") != NULL
    drop trigger
        del_user_phones
go

create trigger
    del_user_phones
on
    user_phones
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_phones: delete "
        + convert(varchar(10), a.user_phone_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + "'" + str_replace(a.country_code, "'", "\'") + "' "
        + "'" + str_replace(a.phone, "'", "\'") + "' "
        + (case when a.title = NULL then "NULL" else "'" + str_replace(a.title, "'", "\'") + "'" end) + " "
        + convert(varchar(10), a.user_phone_type_id) + " "
        + convert(varchar(10), a.user_phone_provider_id) + " "
        + "'" + rtrim(str_replace(a.allow_sms, "'", "\'")) + "' "
        + convert(varchar(10), a.status_id)
    )
from
    deleted a

go
