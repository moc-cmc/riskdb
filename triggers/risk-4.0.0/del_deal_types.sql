
if object_id("del_deal_types") != NULL
    drop trigger
        del_deal_types
go

create trigger
    del_deal_types
on
    deal_types
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_types: delete "
        + convert(varchar(10), a.deal_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
