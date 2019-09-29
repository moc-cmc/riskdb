if object_id("ins_run_strategies") != NULL
    drop trigger
        ins_run_strategies
go

create trigger
    ins_run_strategies
on
    run_strategies
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_strategies: insert "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), strategy_id)
    )
from
    inserted

go