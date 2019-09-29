
if object_id("del_tico_account_types") != NULL
    drop trigger
        del_tico_account_types
go

create trigger
    del_tico_account_types
on
    tico_account_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_account_types: delete "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.login_type_id)
    )
from
    deleted a

go
