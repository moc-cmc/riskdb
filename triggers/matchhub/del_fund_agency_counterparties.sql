
if object_id("del_fund_agency_counterparties") != NULL
    drop trigger
        del_fund_agency_counterparties
go

create trigger
    del_fund_agency_counterparties
on
    fund_agency_counterparties
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_agency_counterparties: delete "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.counterparty_id)
    )
from
    deleted a

go
