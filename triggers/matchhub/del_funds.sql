
if object_id("del_funds") != NULL
    drop trigger
        del_funds
go

create trigger
    del_funds
on
    funds
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".funds: delete "
        + convert(varchar(10), a.fund_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.evaluation_currency_id) + " "
        + convert(varchar(10), a.fund_type_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + "'" + str_replace(a.tico_server, "'", "\'") + "' "
        + "'" + str_replace(a.tico_database, "'", "\'") + "' "
        + (case when a.prime_broker_id = NULL then "NULL" else convert(varchar(10), a.prime_broker_id) end) + " "
        + (case when a.fund_code = NULL then "NULL" else "'" + rtrim(str_replace(a.fund_code, "'", "\'")) + "'" end) + " "
        + (case when a.payments_ext_account_id = NULL then "NULL" else convert(varchar(10), a.payments_ext_account_id) end) + " "
        + (case when a.min_ticket_size = NULL then "NULL" else convert(varchar(10), a.min_ticket_size) end) + " "
        + (case when a.settlement_ext_account_id = NULL then "NULL" else convert(varchar(10), a.settlement_ext_account_id) end) + " "
        + (case when a.nop_type_id = NULL then "NULL" else convert(varchar(10), a.nop_type_id) end) + " "
        + (case when a.pair_margining = NULL then "NULL" else "'" + str_replace(a.pair_margining, "'", "\'") + "'" end) + " "
        + (case when a.settlement_product_id = NULL then "NULL" else convert(varchar(10), a.settlement_product_id) end) + " "
        + (case when a.eod_hour = NULL then "NULL" else convert(varchar(10), a.eod_hour) end)
    )
from
    deleted a

go
