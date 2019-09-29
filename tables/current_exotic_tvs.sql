
if object_id("current_exotic_tvs") != NULL
    drop table
        current_exotic_tvs
go

create table
    current_exotic_tvs (
        contract_id int,
        tv float null,
        delta float null,
        gamma float null,
        theta float null,
        tau float null,
        underlying_price float null,
        volatility float null,
        days float null,
        interest_rate float null,
        carry_cost float null,
        timestamp datetime
    )
go
