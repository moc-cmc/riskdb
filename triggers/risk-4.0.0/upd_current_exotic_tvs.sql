
if object_id("upd_current_exotic_tvs") != NULL
    drop trigger
        upd_current_exotic_tvs
go

create trigger
    upd_current_exotic_tvs
on
    current_exotic_tvs
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".current_exotic_tvs: update "
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
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.timestamp), 9) + "'"
    )
from
    inserted a

go
