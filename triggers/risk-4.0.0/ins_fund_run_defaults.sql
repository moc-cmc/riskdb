
if object_id("ins_fund_run_defaults") != NULL
    drop trigger
        ins_fund_run_defaults
go

create trigger
    ins_fund_run_defaults
on
    fund_run_defaults
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_run_defaults: insert "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.evaluation_currency_id) + " "
        + convert(varchar(10), a.source_id)
    )
from
    inserted a

go
