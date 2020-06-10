
if object_id("ins_bo_prices") != NULL
    drop trigger
        ins_bo_prices
go

create trigger
    ins_bo_prices
on
    bo_prices
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9989,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".bo_prices: insert "
        + convert(varchar(10), a.bo_price_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.price_date), 9) + "' "
        + (case when a.value_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.value_date), 9) + "'" end) + " "
        + convert(varchar(10), a.source_id) + " "
        + convert(varchar(50), a.price)
    )
from
    inserted a

go
