
if object_id("del_channel_login_types") != NULL
    drop trigger
        del_channel_login_types
go

create trigger
    del_channel_login_types
on
    channel_login_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".channel_login_types: delete "
        + convert(varchar(10), a.channel_id) + " "
        + convert(varchar(10), a.login_type_id)
    )
from
    deleted a

go
