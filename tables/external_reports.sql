
if object_id("external_reports") != NULL
    drop table
        external_reports
go

create table
    external_reports (
        external_report_id int,
        name char(100),
        source_id int,
        report_type_id int
    )
go
