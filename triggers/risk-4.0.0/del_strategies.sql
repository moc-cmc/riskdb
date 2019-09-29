
if object_id("del_strategies") != NULL
    drop trigger
        del_strategies
go

create trigger
    del_strategies
on
    strategies
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".strategies: delete "
        + convert(varchar(10), a.strategy_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
