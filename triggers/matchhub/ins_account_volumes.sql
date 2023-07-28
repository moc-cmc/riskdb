
if object_id("ins_account_volumes") != NULL
    drop trigger
        ins_account_volumes
go

create trigger
    ins_account_volumes
on
    account_volumes
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_volumes: insert "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + "'" + convert(varchar(19), a.volume_date, 23) + "." + substring(convert(varchar(15), a.volume_date, 20), 10, 3) + "' "
        + convert(varchar(50), a.volume) + " "
        + convert(varchar(10), a.trade_count) + " "
        + (case when a.volume_adj = NULL then "NULL" else convert(varchar(10), a.volume_adj) end) + " "
        + (case when a.adj_count = NULL then "NULL" else convert(varchar(10), a.adj_count) end)
    )
from
    inserted a

go
