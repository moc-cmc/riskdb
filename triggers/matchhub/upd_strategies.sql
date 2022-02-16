
if object_id("upd_strategies") != NULL
    drop trigger
        upd_strategies
go

create trigger
    upd_strategies
on
    strategies
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".strategies: update "
        + convert(varchar(10), a.strategy_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
