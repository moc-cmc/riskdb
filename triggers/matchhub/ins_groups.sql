
if object_id("ins_groups") != NULL
    drop trigger
        ins_groups
go

create trigger
    ins_groups
on
    groups
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".groups: insert "
        + convert(varchar(10), a.group_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.login_type_id) + " "
        + convert(varchar(10), a.activity_status_id)
    )
from
    inserted a

go
