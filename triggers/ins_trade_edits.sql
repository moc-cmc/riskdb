
if object_id("ins_trade_edits") != NULL
    drop trigger
        ins_trade_edits
go

create trigger
    ins_trade_edits
on
    trade_edits
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".trade_edits: insert "
        + convert(varchar(10), trade_id) + " "
        + convert(varchar(10), deal_id) + " "
        + convert(varchar(10), user_id) + " "
        + convert(varchar(10), trade_type_id) + " "
        + convert(varchar(10), internal_account_id) + " "
        + convert(varchar(10), external_account_id) + " "
        + convert(varchar(10), counterparty_id) + " "
        + convert(varchar(50), quantity) + " "
        + convert(varchar(10), contract_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), value_date), 9) + "' "
        + (case when fixing_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), fixing_date), 9) + "'" end) + " "
        + convert(varchar(50), price) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), trade_date), 9) + "' "
        + convert(varchar(10), trader_id) + " "
        + convert(varchar(10), strategy_id) + " "
        + convert(varchar(10), status_id) + " "
        + convert(varchar(10), broker_id) + " "
        + convert(varchar(10), sales_code_id) + " "
        + "'" + str_replace(identifier, "'", "\'") + "' "
        + (case when pct_price = NULL then "NULL" else convert(varchar(50), pct_price) end) + " "
        + (case when spot_reference = NULL then "NULL" else convert(varchar(50), spot_reference) end) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), timestamp), 9) + "' "
        + convert(varchar(30), price) 
    )
from
    inserted

go
