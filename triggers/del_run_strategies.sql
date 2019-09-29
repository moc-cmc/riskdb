if object_id("del_run_strategies") != NULL
    drop trigger
        del_run_strategies
go

create trigger
    del_run_strategies
on
    run_strategies
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_strategies: delete "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), strategy_id)
    )
from
    deleted

go