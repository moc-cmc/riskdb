
if object_id("fund_run_defaults") != NULL
    drop table
        fund_run_defaults
go

create table
    fund_run_defaults (
        fund_id int,
        evaluation_currency_id int,
        source_id int
    )
go
