
if object_id("del_credit_profile_cptys") != NULL
    drop trigger
        del_credit_profile_cptys
go

create trigger
    del_credit_profile_cptys
on
    credit_profile_counterparties
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_counterparties: delete "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(10), a.counterparty_id)
    )
from
    deleted a

go
