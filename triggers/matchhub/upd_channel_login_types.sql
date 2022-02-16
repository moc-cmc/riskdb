
if object_id("upd_channel_login_types") != NULL
    drop trigger
        upd_channel_login_types
go

create trigger
    upd_channel_login_types
on
    channel_login_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".channel_login_types: update "
        + convert(varchar(10), a.channel_id) + " "
        + convert(varchar(10), a.login_type_id)
    )
from
    inserted a

go
