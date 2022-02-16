
if object_id("ins_user_credit_profiles") != NULL
    drop trigger
        ins_user_credit_profiles
go

create trigger
    ins_user_credit_profiles
on
    user_credit_profiles
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".user_credit_profiles: insert "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.credit_profile_id)
    )
from
    inserted a

go
