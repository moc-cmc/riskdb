
if object_id("del_trade_origin_deals") != NULL
    drop trigger
        del_trade_origin_deals
go

create trigger
    del_trade_origin_deals
on
    trade_origin_deals
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_origin_deals: delete "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.deal_id)
    )
from
    deleted a

go
