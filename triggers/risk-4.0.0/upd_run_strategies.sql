
if object_id("upd_run_strategies") != NULL
    drop trigger
        upd_run_strategies
go

create trigger
    upd_run_strategies
on
    run_strategies
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_strategies: update "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.strategy_id)
    )
from
    inserted a

go
