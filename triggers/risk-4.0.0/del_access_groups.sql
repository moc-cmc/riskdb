
if object_id("del_access_groups") != NULL
    drop trigger
        del_access_groups
go

create trigger
    del_access_groups
on
    access_groups
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".access_groups: delete "
        + convert(varchar(10), a.access_group_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
