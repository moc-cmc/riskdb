if object_id("upd_run_traders") != NULL
    drop trigger
        upd_run_traders
go

create trigger
    upd_run_traders
on
    run_traders
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_traders: update "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), trader_id)
    )
from
    inserted

go