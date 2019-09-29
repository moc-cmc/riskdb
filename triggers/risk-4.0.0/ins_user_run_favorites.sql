
if object_id("ins_user_run_favorites") != NULL
    drop trigger
        ins_user_run_favorites
go

create trigger
    ins_user_run_favorites
on
    user_run_favorites
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_run_favorites: insert "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.run_id)
    )
from
    inserted a

go
