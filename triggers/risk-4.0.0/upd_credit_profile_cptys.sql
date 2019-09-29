
if object_id("upd_credit_profile_cptys") != NULL
    drop trigger
        upd_credit_profile_cptys
go

create trigger
    upd_credit_profile_cptys
on
    credit_profile_counterparties
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_counterparties: update "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(10), a.counterparty_id)
    )
from
    inserted a

go
