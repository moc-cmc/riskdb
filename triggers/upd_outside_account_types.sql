
if object_id("upd_outside_account_types") != NULL
    drop trigger
        upd_outside_account_types
go

create trigger
    upd_outside_account_types
on
    outside_account_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".outside_account_types: update "
        + convert(varchar(10), a.outside_account_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
