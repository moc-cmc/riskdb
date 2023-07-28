
if object_id("ins_run_traders") != NULL
    drop trigger
        ins_run_traders
go

create trigger
    ins_run_traders
on
    run_traders
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_traders: insert "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.trader_id)
    )
from
    inserted a

go
