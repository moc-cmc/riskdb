
if object_id("upd_user_run_favorites") != NULL
    drop trigger
        upd_user_run_favorites
go

create trigger
    upd_user_run_favorites
on
    user_run_favorites
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_run_favorites: update "
        + convert(varchar(10), a.tico_account_id) + " "
        + convert(varchar(10), a.run_id)
    )
from
    inserted a

go
