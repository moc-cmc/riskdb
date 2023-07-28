
if object_id("upd_trade_origin_deals") != NULL
    drop trigger
        upd_trade_origin_deals
go

create trigger
    upd_trade_origin_deals
on
    trade_origin_deals
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_origin_deals: update "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.deal_id)
    )
from
    inserted a

go
