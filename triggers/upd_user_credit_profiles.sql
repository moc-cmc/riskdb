
if object_id("upd_user_credit_profiles") != NULL
    drop trigger
        upd_user_credit_profiles
go

create trigger
    upd_user_credit_profiles
on
    user_credit_profiles
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_credit_profiles: update "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.credit_profile_id)
    )
from
    inserted a

go
