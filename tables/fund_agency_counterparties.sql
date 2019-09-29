
if object_id("fund_agency_counterparties") != NULL
    drop table
        fund_agency_counterparties
go

create table
    fund_agency_counterparties (
        fund_id int,
        counterparty_id int
    )
go

create unique index
    u_fac
on
    fund_agency_counterparties (
        fund_id,
        counterparty_id
    )
go