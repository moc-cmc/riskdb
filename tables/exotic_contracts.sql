
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
        barrier float null,
        ko_ki_date datetime null
    )
go
