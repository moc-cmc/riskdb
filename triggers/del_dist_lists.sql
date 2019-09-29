
if object_id("del_dist_lists") != NULL
    drop trigger
        del_dist_lists
go

create trigger
    del_dist_lists
on
    dist_lists
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dist_lists: delete "
        + convert(varchar(10), a.dist_list_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
