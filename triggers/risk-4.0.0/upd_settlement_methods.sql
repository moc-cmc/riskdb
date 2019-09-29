
if object_id("upd_settlement_methods") != NULL
    drop trigger
        upd_settlement_methods
go

create trigger
    upd_settlement_methods
on
    settlement_methods
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".settlement_methods: update "
        + convert(varchar(10), a.settlement_method_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
