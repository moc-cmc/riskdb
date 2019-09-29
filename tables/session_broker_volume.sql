
if object_id("session_broker_volume") != NULL
    drop table
        session_broker_volume
go

create table
    session_broker_volume (
        session_id int,
        broker_id int,
        spot_usd_equiv float,
        option_usd_equiv float,
        exotic_usd_equiv float,
        futures_usd_equiv float,
        futures_contracts int,
        fut_opt_contracts int,
        total_volume float
    )
go
