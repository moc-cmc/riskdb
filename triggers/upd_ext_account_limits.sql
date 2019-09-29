if object_id("upd_ext_account_limits") != NULL
    drop trigger
        upd_ext_account_limits
go

create trigger
    upd_ext_account_limits
on
    ext_account_limits
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".ext_account_limits: update "
        + convert(varchar(50), ext_account_limit_id) + " "
        + convert(varchar(10), external_account_id) + " "
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