
if object_id("ins_fund_sub_types") != NULL
    drop trigger
        ins_fund_sub_types
go

create trigger
    ins_fund_sub_types
on
    fund_sub_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fund_sub_types: insert "
        + (case when a.fund_id = NULL then "NULL" else convert(varchar(10), a.fund_id) end) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
