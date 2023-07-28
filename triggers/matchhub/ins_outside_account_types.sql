
if object_id("ins_outside_account_types") != NULL
    drop trigger
        ins_outside_account_types
go

create trigger
    ins_outside_account_types
on
    outside_account_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".outside_account_types: insert "
        + convert(varchar(10), a.outside_account_type_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
