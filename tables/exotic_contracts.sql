
if object_id("exotic_contracts") != NULL
    drop table
        exotic_contracts
go

create table
    exotic_contracts (
        contract_id int,
        option_expiration_id int,
        exercise_style_id int null,
        strike float null,
        put_call char(2) null,
        timing_id int null,
        payout_ccy_id int null,
        payout_amount float null,
        barrier_type_id int null,
        lower_barrier float null,
        upper_barrier float null,
        barrier float null,
        exotic_instrument_id int null,
        window_start datetime null,
        window_end datetime null,
        ko_ki_date datetime null
    )
go
