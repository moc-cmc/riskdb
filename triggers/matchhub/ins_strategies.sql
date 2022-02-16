
if object_id("ins_strategies") != NULL
    drop trigger
        ins_strategies
go

create trigger
    ins_strategies
on
    strategies
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".strategies: insert "
        + convert(varchar(10), a.strategy_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
