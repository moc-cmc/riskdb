if object_id("del_run_brokers") != NULL
    drop trigger
        del_run_brokers
go

create trigger
    del_run_brokers
on
    run_brokers
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_brokers: delete "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), broker_id)
    )
from
    deleted

go