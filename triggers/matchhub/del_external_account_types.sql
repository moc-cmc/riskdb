
if object_id("del_external_account_types") != NULL
    drop trigger
        del_external_account_types
go

create trigger
    del_external_account_types
on
    external_account_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_account_types: delete "
        + convert(varchar(50), a.external_account_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
