
if object_id("del_user_credit_profiles") != NULL
    drop trigger
        del_user_credit_profiles
go

create trigger
    del_user_credit_profiles
on
    user_credit_profiles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_credit_profiles: delete "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.credit_profile_id)
    )
from
    deleted a

go
