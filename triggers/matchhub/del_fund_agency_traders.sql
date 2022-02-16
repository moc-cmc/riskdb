
if object_id("del_fund_agency_traders") != NULL
    drop trigger
        del_fund_agency_traders
go

create trigger
    del_fund_agency_traders
on
    fund_agency_traders
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_agency_traders: delete "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.trader_id)
    )
from
    deleted a

go
