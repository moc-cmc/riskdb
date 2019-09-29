
if object_id("pip_adjustments") != NULL
    drop table
        pip_adjustments
go

create table
    pip_adjustments (
        pip_adjustment_id int,
        fund_id int,
        broker_id int,
        contract_id int,
        adjustment float,
        as_of datetime
    )
go
