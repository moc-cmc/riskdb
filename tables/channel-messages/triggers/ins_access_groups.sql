
if object_id("ins_access_groups") != NULL
    drop trigger
        ins_access_groups
go

create trigger
    ins_access_groups
on
    access_groups
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".access_groups: insert "
        + convert(varchar(10), a.access_group_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
