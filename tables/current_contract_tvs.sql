
if object_id("current_contract_tvs") != NULL
    drop table
        current_contract_tvs
go

create table
    current_contract_tvs (
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
