
if object_id("del_fund_run_defaults") != NULL
    drop trigger
        del_fund_run_defaults
go

create trigger
    del_fund_run_defaults
on
    fund_run_defaults
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_run_defaults: delete "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.evaluation_currency_id) + " "
        + convert(varchar(10), a.source_id)
    )
from
    deleted a

go
