
if object_id("ins_option_expirations") != NULL
    drop trigger
        ins_option_expirations
go

create trigger
    ins_option_expirations
on
    option_expirations
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".option_expirations: insert "
        + convert(varchar(10), a.option_expiration_id) + " "
        + convert(varchar(10), a.option_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + convert(varchar(19), a.expiration, 23) + "." + substring(convert(varchar(15), a.expiration, 20), 10, 3) + "' "
        + convert(varchar(10), a.timezone_id)
    )
from
    inserted a

go
