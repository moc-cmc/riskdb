
if object_id("fund_portfolios") != NULL
    drop table
        fund_portfolios
go

create table
    fund_portfolios (
        fund_id int,
        portfolio_id int
    )
go
