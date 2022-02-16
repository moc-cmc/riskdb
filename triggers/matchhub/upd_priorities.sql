
if object_id("upd_priorities") != NULL
    drop trigger
        upd_priorities
go

create trigger
    upd_priorities
on
    priorities
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".priorities: update "
        + convert(varchar(10), a.priority_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.number)
    )
from
    inserted a

go
