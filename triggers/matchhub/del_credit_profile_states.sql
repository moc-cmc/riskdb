
if object_id("del_credit_profile_states") != NULL
    drop trigger
        del_credit_profile_states
go

create trigger
    del_credit_profile_states
on
    credit_profile_states
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_states: delete "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(50), a.nop_usage) + " "
        + convert(varchar(50), a.dsl_usage) + " "
        + convert(varchar(10), a.nop_credit_status_id) + " "
        + convert(varchar(10), a.dsl_credit_status_id) + " "
        + "'" + convert(varchar(19), a.timestamp, 23) + "." + substring(convert(varchar(15), a.timestamp, 20), 10, 3) + "'"
    )
from
    deleted a

go
