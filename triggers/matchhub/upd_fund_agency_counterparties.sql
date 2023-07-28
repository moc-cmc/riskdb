
if object_id("upd_fund_agency_counterparties") != NULL
    drop trigger
        upd_fund_agency_counterparties
go

create trigger
    upd_fund_agency_counterparties
on
    fund_agency_counterparties
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_agency_counterparties: update "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.counterparty_id)
    )
from
    inserted a

go
