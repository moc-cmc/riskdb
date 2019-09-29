
if object_id("run_trader_pos_cache") != NULL
    drop table
        run_trader_pos_cache
go

create table
    run_trader_pos_cache (
        run_id int,
        trader_id int,
        date datetime,
        contract_id int,
        value_date datetime,
        quantity numeric(30,4)
    )
go
