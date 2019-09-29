
if object_id("ins_fund_agency_counterparties") != NULL
    drop trigger
        ins_fund_agency_counterparties
go

create trigger
    ins_fund_agency_counterparties
on
    fund_agency_counterparties
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_agency_counterparties: insert "
        + convert(varchar(10), a.fund_id) + " "
        + convert(varchar(10), a.counterparty_id)
    )
from
    inserted a

go
