
if object_id("ins_trade_origin_deals") != NULL
    drop trigger
        ins_trade_origin_deals
go

create trigger
    ins_trade_origin_deals
on
    trade_origin_deals
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_origin_deals: insert "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.deal_id)
    )
from
    inserted a

go
