
if object_id("upd_fund_agency_traders") != NULL
    drop trigger
        upd_fund_agency_traders
go

create trigger
    upd_fund_agency_traders
on
    fund_agency_traders
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_agency_traders: update "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.trader_id)
    )
from
    inserted a

go
