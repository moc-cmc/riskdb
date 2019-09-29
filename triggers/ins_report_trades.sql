
if object_id("ins_report_trades") != NULL
    drop trigger
        ins_report_trades
go

create trigger
    ins_report_trades
on
    report_trades
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".report_trades: insert "
        + convert(varchar(10), report_trade_id) + " "
        + (case when report_deal_id = NULL then "NULL" else convert(varchar(10), report_deal_id) end) + " "
        + convert(varchar(10), report_commit_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), import_date), 9) + "' "
        + convert(varchar(10), trade_type_id) + " "
        + convert(varchar(10), external_account_type_id) + " "
        + (case when external_account_id = NULL then "NULL" else convert(varchar(10), external_account_id) end) + " "
        + convert(varchar(10), counterparty_id) + " "
        + convert(varchar(50), quantity) + " "
        + convert(varchar(10), contract_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), value_date), 9) + "' "
        + (case when fixing_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), fixing_date), 9) + "'" end) + " "
        + convert(varchar(50), price) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), trade_date), 9) + "' "
        + (case when trader_id = NULL then "NULL" else convert(varchar(10), trader_id) end) + " "
        + (case when strategy_id = NULL then "NULL" else convert(varchar(10), strategy_id) end) + " "
        + convert(varchar(10), status_id) + " "
        + (case when broker_id = NULL then "NULL" else convert(varchar(10), broker_id) end) + " "
        + "'" + str_replace(identifier, "'", "\'") + "' "
        + (case when pct_price = NULL then "NULL" else convert(varchar(50), pct_price) end) + " "
        + (case when spot_reference = NULL then "NULL" else convert(varchar(50), spot_reference) end) + " "
        + (case when reporter_identifier = NULL then "NULL" else "'" + str_replace(reporter_identifier, "'", "\'") + "'" end) + " "
        + (case when trade_id = NULL then "NULL" else convert(varchar(10), trade_id) end)
    )
from
    inserted

go