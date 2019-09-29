
if object_id("del_outside_account_types") != NULL
    drop trigger
        del_outside_account_types
go

create trigger
    del_outside_account_types
on
    outside_account_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".outside_account_types: delete "
        + convert(varchar(10), a.outside_account_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
