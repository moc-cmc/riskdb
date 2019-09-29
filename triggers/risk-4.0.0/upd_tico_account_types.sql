
if object_id("upd_tico_account_types") != NULL
    drop trigger
        upd_tico_account_types
go

create trigger
    upd_tico_account_types
on
    tico_account_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_account_types: update "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.login_type_id)
    )
from
    inserted a

go
