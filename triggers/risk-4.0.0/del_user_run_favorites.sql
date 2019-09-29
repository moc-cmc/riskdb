
if object_id("del_user_run_favorites") != NULL
    drop trigger
        del_user_run_favorites
go

create trigger
    del_user_run_favorites
on
    user_run_favorites
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_run_favorites: delete "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.run_id)
    )
from
    deleted a

go
