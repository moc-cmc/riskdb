
if object_id("report_credits") != NULL
    drop table
        report_credits
go

create table
    report_credits (
        report_credit_id int identity,
        report_commit_id int,
        import_date datetime,
        identifier varchar(100) null,
        activity_date datetime,
        activity varchar(25) null,
        external_account_id int,
        value_date datetime,
        quantity numeric(30,4)
    )
go
