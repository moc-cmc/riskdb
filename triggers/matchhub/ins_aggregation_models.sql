
if object_id("ins_aggregation_models") != NULL
    drop trigger
        ins_aggregation_models
go

create trigger
    ins_aggregation_models
on
    aggregation_models
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".aggregation_models: insert "
        + convert(varchar(10), a.aggregation_model_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.trade_type_id) + " "
        + (case when a.internal_account_id = NULL then "NULL" else convert(varchar(10), a.internal_account_id) end) + " "
        + (case when a.external_account_id = NULL then "NULL" else convert(varchar(10), a.external_account_id) end) + " "
        + (case when a.trader_id = NULL then "NULL" else convert(varchar(10), a.trader_id) end) + " "
        + (case when a.strategy_id = NULL then "NULL" else convert(varchar(10), a.strategy_id) end) + " "
        + (case when a.broker_id = NULL then "NULL" else convert(varchar(10), a.broker_id) end) + " "
        + (case when a.counterparty_id = NULL then "NULL" else convert(varchar(10), a.counterparty_id) end) + " "
        + (case when a.run_id = NULL then "NULL" else convert(varchar(10), a.run_id) end)
    )
from
    inserted a

go
