
if object_id("upd_dist_lists") != NULL
    drop trigger
        upd_dist_lists
go

create trigger
    upd_dist_lists
on
    dist_lists
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".dist_lists: update "
        + convert(varchar(10), a.dist_list_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
