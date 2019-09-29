
if object_id("trade_spot_references") != NULL
    drop table
        trade_spot_references
go

create table
    trade_spot_references (
        trade_id int,
        spot_reference float
    )
go
