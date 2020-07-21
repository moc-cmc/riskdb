
if object_id("ins_quotes") != NULL
    drop trigger
        ins_quotes
go

create trigger
    ins_quotes
on
    quotes
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".quotes: insert "
        + convert(varchar(10), a.quote_id) + " "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.account_id) + " "
        + convert(varchar(10), a.quote_type_id) + " "
        + convert(varchar(10), a.quantity) + " "
        + convert(varchar(50), a.price) + " "
        + convert(varchar(10), a.status_id) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "'"
    )
from
    inserted a

go
