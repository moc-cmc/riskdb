
if object_id("run_position_cache") != NULL
    drop table
        run_position_cache
go

create table
    run_position_cache (
        run_id int,
        date datetime,
        contract_id int,
        quantity numeric(30,0)
    )
go
