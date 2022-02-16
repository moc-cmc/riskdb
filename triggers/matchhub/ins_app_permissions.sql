
if object_id("ins_app_permissions") != NULL
    drop trigger
        ins_app_permissions
go

create trigger
    ins_app_permissions
on
    app_permissions
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".app_permissions: insert "
        + convert(varchar(10), a.app_permission_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
