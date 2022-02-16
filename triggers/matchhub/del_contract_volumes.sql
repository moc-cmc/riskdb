
if object_id("del_contract_volumes") != NULL
    drop trigger
        del_contract_volumes
go

create trigger
    del_contract_volumes
on
    contract_volumes
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".contract_volumes: delete "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(19), a.volume_date, 23) + "." + substring(convert(varchar(15), a.volume_date, 20), 10, 3) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count) + " "
        + (case when a.adj_count = NULL then "NULL" else convert(varchar(10), a.adj_count) end) + " "
        + (case when a.volume_adj = NULL then "NULL" else convert(varchar(10), a.volume_adj) end)
    )
from
    deleted a

go
