
if object_id("del_bo_prices") != NULL
    drop trigger
        del_bo_prices
go

create trigger
    del_bo_prices
on
    bo_prices
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_prices: delete "
        + convert(varchar(10), a.bo_price_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + "'" + convert(varchar(19), a.price_date, 23) + "." + substring(convert(varchar(15), a.price_date, 20), 10, 3) + "' "
        + (case when a.value_date = NULL then "NULL" else "'" + convert(varchar(19), a.value_date, 23) + "." + substring(convert(varchar(15), a.value_date, 20), 10, 3) + "'" end) + " "
        + convert(varchar(10), a.source_id) + " "
        + convert(varchar(50), a.price)
    )
from
    deleted a

go
