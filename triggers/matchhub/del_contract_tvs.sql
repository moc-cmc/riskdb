
if object_id("del_contract_tvs") != NULL
    drop trigger
        del_contract_tvs
go

create trigger
    del_contract_tvs
on
    contract_tvs
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".contract_tvs: delete "
        + convert(varchar(10), a.contract_tv_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + (case when a.tv = NULL then "NULL" else convert(varchar(50), a.tv) end) + " "
        + (case when a.delta = NULL then "NULL" else convert(varchar(50), a.delta) end) + " "
        + (case when a.gamma = NULL then "NULL" else convert(varchar(50), a.gamma) end) + " "
        + (case when a.theta = NULL then "NULL" else convert(varchar(50), a.theta) end) + " "
        + (case when a.tau = NULL then "NULL" else convert(varchar(50), a.tau) end) + " "
        + (case when a.underlying_price = NULL then "NULL" else convert(varchar(50), a.underlying_price) end) + " "
        + (case when a.volatility = NULL then "NULL" else convert(varchar(50), a.volatility) end) + " "
        + (case when a.days = NULL then "NULL" else convert(varchar(50), a.days) end) + " "
        + (case when a.interest_rate = NULL then "NULL" else convert(varchar(50), a.interest_rate) end) + " "
        + (case when a.carry_cost = NULL then "NULL" else convert(varchar(50), a.carry_cost) end) + " "
        + "'" + convert(varchar(19), a.tv_date, 23) + "." + substring(convert(varchar(15), a.tv_date, 20), 10, 3) + "'"
    )
from
    deleted a

go
