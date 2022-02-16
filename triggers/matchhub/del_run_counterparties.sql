
if object_id("del_run_counterparties") != NULL
    drop trigger
        del_run_counterparties
go

create trigger
    del_run_counterparties
on
    run_counterparties
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_counterparties: delete "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.counterparty_id)
    )
from
    deleted a

go
