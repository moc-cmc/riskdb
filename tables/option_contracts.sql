
if object_id("option_contracts") != NULL
    drop table
        option_contracts
go

create table
    option_contracts (
        contract_id int,
        option_expiration_id int,
        exercise_style_id int,
        strike float,
        put_call char(2)
    )
go
