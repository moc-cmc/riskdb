
if object_id("upd_fund_types") != NULL
    drop trigger
        upd_fund_types
go

create trigger
    upd_fund_types
on
    fund_types
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_types: update "
        + convert(varchar(10), a.fund_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
