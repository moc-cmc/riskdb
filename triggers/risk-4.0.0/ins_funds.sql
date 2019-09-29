
if object_id("ins_funds") != NULL
    drop trigger
        ins_funds
go

create trigger
    ins_funds
on
    funds
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".funds: insert "
        + convert(varchar(10), a.fund_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "' "
        + convert(varchar(10), a.evaluation_currency_id) + " "
        + convert(varchar(10), a.fund_type_id) + " "
        + convert(varchar(10), a.status_id) + " "
        + "'" + str_replace(a.tico_server, "'", "\'") + "' "
        + "'" + str_replace(a.tico_database, "'", "\'") + "' "
        + (case when a.prime_broker_id = NULL then "NULL" else convert(varchar(10), a.prime_broker_id) end) + " "
        + (case when a.fund_code = NULL then "NULL" else "'" + rtrim(str_replace(a.fund_code, "'", "\'")) + "'" end)
    )
from
    inserted a

go
