
if object_id("del_run_traders") != NULL
    drop trigger
        del_run_traders
go

create trigger
    del_run_traders
on
    run_traders
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_traders: delete "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.trader_id)
    )
from
    deleted a

go
