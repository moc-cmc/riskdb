
if object_id("report_trade_matches") != NULL
    drop table
        report_trade_matches
go

create table
    report_trade_matches (
        report_trade_match_id numeric(10,0) identity,
        report_commit_id int,
        trade_id int,
        report_trade_id int,
        inverted bit,
        match_strength float,
        symbols_match bit,
        status_id int,
        status_date datetime,
        quantity numeric(30,4) null,
        price float null
    )
go
