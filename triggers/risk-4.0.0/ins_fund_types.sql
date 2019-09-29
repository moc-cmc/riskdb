
if object_id("ins_fund_types") != NULL
    drop trigger
        ins_fund_types
go

create trigger
    ins_fund_types
on
    fund_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_types: insert "
        + convert(varchar(10), a.fund_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
