
if object_id("bo_spot_settles") != NULL
    drop table
        bo_spot_settles
go

create table
    bo_spot_settles (
        bo_spot_settle_id int identity,
        contract_id int,
        source_id int,
        price_date datetime,
        price float
    )
go
