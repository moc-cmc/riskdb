
if object_id("ins_tico_account_types") != NULL
    drop trigger
        ins_tico_account_types
go

create trigger
    ins_tico_account_types
on
    tico_account_types
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".tico_account_types: insert "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.login_type_id)
    )
from
    inserted a

go
