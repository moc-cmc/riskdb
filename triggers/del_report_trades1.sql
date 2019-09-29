if object_id("del_report_trades") != NULL
    drop trigger
        del_report_trades
go

create trigger
    del_report_trades
on
    report_trades
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".report_trades: delete "
        + convert(varchar(50), report_trade_id) + " "
        + convert(varchar(10), report_commit_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), import_date), 9) + "' "
        + (case when identifier = NULL then "NULL" else "'" + str_replace(identifier, "'", "\'") + "'" end) + " "
        + (case when client_identifier = NULL then "NULL" else "'" + str_replace(client_identifier, "'", "\'") + "'" end) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), activity_date), 9) + "' "
        + (case when activity = NULL then "NULL" else "'" + str_replace(activity, "'", "\'") + "'" end) + " "
        + convert(varchar(10), external_account_id) + " "
        + (case when trade_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), trade_date), 9) + "'" end) + " "
        + (case when nominal_contract_symbol = NULL then "NULL" else "'" + str_replace(nominal_contract_symbol, "'", "\'") + "'" end) + " "
        + (case when ccy_1 = NULL then "NULL" else "'" + str_replace(ccy_1, "'", "\'") + "'" end) + " "
        + convert(varchar(50), ccy_1_quantity) + " "
        + (case when ccy_2 = NULL then "NULL" else "'" + str_replace(ccy_2, "'", "\'") + "'" end) + " "
        + (case when ccy_2_quantity = NULL then "NULL" else convert(varchar(50), ccy_2_quantity) end) + " "
        + convert(varchar(50), nominal_price) + " "
        + (case when value_date = NULL then "NULL" else "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), value_date), 9) + "'" end) + " "
        + convert(varchar(10), status_id) + " "
        + convert(varchar(10), strategy_id) + " "
        + (case when broker_id = NULL then "NULL" else convert(varchar(10), broker_id) end) + " "
        + (case when broker_identifier = NULL then "NULL" else "'" + str_replace(broker_identifier, "'", "\'") + "'" end) + " "
        + (case when spoke_bank = NULL then "NULL" else "'" + str_replace(spoke_bank, "'", "\'") + "'" end) + " "
        + (case when indicators = NULL then "NULL" else "'" + str_replace(indicators, "'", "\'") + "'" end) + " "
        + (case when description = NULL then "NULL" else "'" + str_replace(description, "'", "\'") + "'" end) + " "
        + (case when lifecycle_status = NULL then "NULL" else "'" + str_replace(lifecycle_status, "'", "\'") + "'" end) + " "
        + (case when matching_status = NULL then "NULL" else "'" + str_replace(matching_status, "'", "\'") + "'" end) + " "
        + (case when approval_status = NULL then "NULL" else "'" + str_replace(approval_status, "'", "\'") + "'" end) + " "
        + (case when allocation_status = NULL then "NULL" else "'" + str_replace(allocation_status, "'", "\'") + "'" end) + " "
        + (case when processing_status = NULL then "NULL" else "'" + str_replace(processing_status, "'", "\'") + "'" end)
    )
from
    deleted

go