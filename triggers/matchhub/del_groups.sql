
if object_id("del_groups") != NULL
    drop trigger
        del_groups
go

create trigger
    del_groups
on
    groups
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".groups: delete "
        + convert(varchar(10), a.group_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.login_type_id) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    deleted a

go
