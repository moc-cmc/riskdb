
if object_id("run_ext_account_pos_cache") != NULL
    drop table
        run_ext_account_pos_cache
go

create table
    run_ext_account_pos_cache (
        run_id int,
        external_account_id int,
        date datetime,
        contract_id int,
        value_date datetime,
        quantity numeric(30,4)
    )
go
