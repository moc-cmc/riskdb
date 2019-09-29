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
        + convert(varchar(10), external_account_id) + " "
        + "'" + str_replace(instrument_type, "'", "\'") + "' "
        + "'" + str_replace(symbol, "'", "\'") + "' "
        + "'" + str_replace(name, "'", "\'") + "' "
        + convert(varchar(10), external_account_type_id) + " "
        + convert(varchar(10), internal_account_id) + " "
        + convert(varchar(10), evaluation_currency_id) + " "
        + convert(varchar(10), aggregation_style_id)
    )
from
    inserted

go