if object_id("ins_run_counterparties") != NULL
    drop trigger
        ins_run_counterparties
go

create trigger
    ins_run_counterparties
on
    run_counterparties
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_counterparties: insert "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), counterparty_id)
    )
from
    inserted

go