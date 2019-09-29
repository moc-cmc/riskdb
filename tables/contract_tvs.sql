
if object_id("contract_tvs") != NULL
    drop table
        contract_tvs
go

create table
    contract_tvs (
        contract_tv_id int,
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
        tv_date datetime
    )
go
