
if object_id("del_priorities") != NULL
    drop trigger
        del_priorities
go

create trigger
    del_priorities
on
    priorities
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".priorities: delete "
        + convert(varchar(10), a.priority_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.number)
    )
from
    deleted a

go
