
if object_id("del_settlement_methods") != NULL
    drop trigger
        del_settlement_methods
go

create trigger
    del_settlement_methods
on
    settlement_methods
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".settlement_methods: delete "
        + convert(varchar(10), a.settlement_method_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
