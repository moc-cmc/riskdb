if object_id("upd_run_brokers") != NULL
    drop trigger
        upd_run_brokers
go

create trigger
    upd_run_brokers
on
    run_brokers
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_brokers: update "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), broker_id)
    )
from
    inserted

go