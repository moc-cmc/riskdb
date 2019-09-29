if object_id("upd_credit_profiles") != NULL
    drop trigger
        upd_credit_profiles
go

create trigger
    upd_credit_profiles
on
    credit_profiles
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profiles: update "
        + convert(varchar(50), credit_profile_id) + " '"
        + rtrim(convert(varchar(50), name)) + "' "
        + convert(varchar(10), currency_id) + " "
        + (case when nop_type_id = NULL then "NULL" else convert(varchar(10), nop_type_id) end) + " "
        + (case when nop_limit = NULL then "NULL" else convert(varchar(50), nop_limit) end) + " "
        + (case when dsl_type_id = NULL then "NULL" else convert(varchar(10), dsl_type_id) end) + " "
        + (case when dsl_limit = NULL then "NULL" else convert(varchar(50), dsl_limit) end) + " "
        + convert(varchar(50), notice_level) + " "
        + convert(varchar(50), warning_level) + " "
        + convert(varchar(50), blocked_level)
    )
from
    inserted

go
