
if object_id("portfolios") != NULL
    drop table
        portfolios
go

create table
    portfolios (
        portfolio_id int,
        name char(100)
    )
go
