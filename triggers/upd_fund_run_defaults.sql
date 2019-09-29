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
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_run_defaults: update "
        + convert(varchar(10), fund_id) + " "
        + convert(varchar(10), evaluation_currency_id) + " "
        + convert(varchar(10), source_id)
    )
from
    inserted

go