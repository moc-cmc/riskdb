
if object_id("ins_external_accounts") != NULL
    drop trigger
        ins_external_accounts
go

create trigger
    ins_external_accounts
on
    external_accounts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_accounts: insert "
        + convert(varchar(10), a.external_account_id) + " "
        + "'" + str_replace(a.instrument_type, "'", "\'") + "' "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.external_account_type_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + convert(varchar(10), a.evaluation_currency_id) + " "
        + convert(varchar(10), a.aggregation_style_id) + " "
        + convert(varchar(10), a.settlement_method_id) + " "
        + (case when a.lp_transparency = NULL then "NULL" else "'" + str_replace(a.lp_transparency, "'", "\'") + "'" end) + " "
        + (case when a.max_mtd_statement_trades = NULL then "NULL" else convert(varchar(10), a.max_mtd_statement_trades) end) + " "
        + (case when a.margin_multiplier = NULL then "NULL" else convert(varchar(50), a.margin_multiplier) end)
    )
from
    inserted a

go
