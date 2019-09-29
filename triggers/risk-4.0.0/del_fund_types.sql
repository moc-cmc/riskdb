
if object_id("del_fund_types") != NULL
    drop trigger
        del_fund_types
go

create trigger
    del_fund_types
on
    fund_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_types: delete "
        + convert(varchar(10), a.fund_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
