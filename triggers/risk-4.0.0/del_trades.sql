
if object_id("del_trades") != NULL
    drop trigger
        del_trades
go

create trigger
    del_trades
on
    trades
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trades: delete "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.deal_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.trade_type_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.counterparty_id) + " "
        + convert(varchar(50), a.quantity) + " "
        + convert(varchar(10), a.contract_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.value_date), 9) + "' "
        + (case when a.fixing_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.fixing_date), 9) + "'" end) + " "
        + convert(varchar(50), a.price) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.trade_date), 9) + "' "
        + convert(varchar(10), a.trader_id) + " "
        + convert(varchar(10), a.strategy_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + convert(varchar(10), a.broker_id) + " "
        + convert(varchar(10), a.sales_code_id) + " "
        + "'" + str_replace(a.identifier, "'", "\'") + "' "
        + (case when a.pct_price = NULL then "NULL" else convert(varchar(50), a.pct_price) end) + " "
        + (case when a.spot_reference = NULL then "NULL" else convert(varchar(50), a.spot_reference) end)
    )
from
    deleted a

go
