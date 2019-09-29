
if object_id("ins_run_brokers") != NULL
    drop trigger
        ins_run_brokers
go

create trigger
    ins_run_brokers
on
    run_brokers
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_brokers: insert "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.broker_id)
    )
from
    inserted a

go
