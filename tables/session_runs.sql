
if object_id("session_runs") != NULL
    drop table
        session_runs
go

create table
    session_runs (
        session_id int,
        run_id int,
        trade_date datetime,
        p_l float
    )
go
