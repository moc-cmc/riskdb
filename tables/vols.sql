
if object_id("vols") != NULL
    drop table
        vols
go

create table
    vols (
        vol_id int,
        contract_id int,
        vol_date datetime,
        vol float
    )
go
