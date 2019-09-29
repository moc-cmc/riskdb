
if object_id("risk_server_runs") != NULL
    drop table
        risk_server_runs
go

create table
    risk_server_runs (
        run_id int 
    )
go
