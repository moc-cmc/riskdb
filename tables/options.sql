
if object_id("options") != NULL
    drop table
        options
go

create table
    options (
        option_id int,
        underlying_contract_id int,
        exchange_id int,
        def_exercise_style_id int,
        quantity numeric(30,0),
        tick_size float
    )
go
