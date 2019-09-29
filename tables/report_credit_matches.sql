
if object_id("report_credit_matches") != NULL
    drop table
        report_credit_matches
go

create table
    report_credit_matches (
        report_credit_match_id int identity,
        report_commit_id int,
        external_account_id int,
        report_credit_id int,
        match_strength float,
        status_id int,
        status_date datetime
    )
go
