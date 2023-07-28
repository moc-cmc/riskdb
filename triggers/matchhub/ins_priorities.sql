
if object_id("ins_priorities") != NULL
    drop trigger
        ins_priorities
go

create trigger
    ins_priorities
on
    priorities
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".priorities: insert "
        + convert(varchar(10), a.priority_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.number)
    )
from
    inserted a

go
