
if object_id("del_option_expirations") != NULL
    drop trigger
        del_option_expirations
go

create trigger
    del_option_expirations
on
    option_expirations
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".option_expirations: delete "
        + convert(varchar(10), a.option_expiration_id) + " "
        + convert(varchar(10), a.option_id) + " "
        + "'" + str_replace(a.symbol, "'", "\'") + "' "
        + "'" + convert(varchar(19), a.expiration, 23) + "." + substring(convert(varchar(15), a.expiration, 20), 10, 3) + "' "
        + convert(varchar(10), a.timezone_id)
    )
from
    deleted a

go
