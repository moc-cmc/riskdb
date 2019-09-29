
if object_id("ins_dist_lists") != NULL
    drop trigger
        ins_dist_lists
go

create trigger
    ins_dist_lists
on
    dist_lists
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dist_lists: insert "
        + convert(varchar(10), a.dist_list_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
