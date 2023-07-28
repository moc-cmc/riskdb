
if object_id("ins_user_app_versions") != NULL
    drop trigger
        ins_user_app_versions
go

create trigger
    ins_user_app_versions
on
    user_app_versions
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_app_versions: insert "
        + convert(varchar(10), a.user_app_version_id) + " "
        + convert(varchar(10), a.user_app_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.status_id)
    )
from
    inserted a

go
