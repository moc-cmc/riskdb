
if object_id("fund_reports") != NULL
    drop table
        fund_reports
go

create table
    fund_reports (
        fund_report_id int identity,
        fund_id int,
        external_report_id int,
        match_inverted_trades bit,
        match_inverted_rolls bit,
        default_trader_id int null,
        default_broker_id int null,
        roll_trader_id int null,
        roll_currency_id int null,
        default_internal_account_id int
    )
go
