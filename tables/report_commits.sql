
if object_id("report_commits") != NULL
    drop table
        report_commits
go

create table
    report_commits (
        report_commit_id int identity,
        fund_report_id int,
        trade_date datetime,
        status_id int,
        update_date datetime
    )
go
