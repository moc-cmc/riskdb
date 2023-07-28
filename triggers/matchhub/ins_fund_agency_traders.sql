
if object_id("ins_fund_agency_traders") != NULL
    drop trigger
        ins_fund_agency_traders
go

create trigger
    ins_fund_agency_traders
on
    fund_agency_traders
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_agency_traders: insert "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.trader_id)
    )
from
    inserted a

go
