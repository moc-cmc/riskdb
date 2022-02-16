
if object_id("del_credit_profiles") != NULL
    drop trigger
        del_credit_profiles
go

create trigger
    del_credit_profiles
on
    credit_profiles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profiles: delete "
        + convert(varchar(10), a.credit_profile_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.currency_id) + " "
        + convert(varchar(10), a.nop_type_id) + " "
        + convert(varchar(50), a.nop_limit) + " "
        + convert(varchar(10), a.dsl_type_id) + " "
        + convert(varchar(50), a.dsl_limit) + " "
        + convert(varchar(50), a.notice_level) + " "
        + convert(varchar(50), a.warning_level) + " "
        + convert(varchar(50), a.blocked_level)
    )
from
    deleted a

go
