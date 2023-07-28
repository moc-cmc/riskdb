
if object_id("upd_fund_run_defaults") != NULL
    drop trigger
        upd_fund_run_defaults
go

create trigger
    upd_fund_run_defaults
on
    fund_run_defaults
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_run_defaults: update "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.evaluation_currency_id) + " "
        + convert(varchar(10), a.source_id)
    )
from
    inserted a

go
