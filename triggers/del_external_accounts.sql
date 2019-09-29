if object_id("del_external_accounts") != NULL
    drop trigger
        del_external_accounts
go

create trigger
    del_external_accounts
on
    external_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".external_accounts: delete "
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
    deleted

go