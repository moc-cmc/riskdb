
if object_id("ins_credit_profile_cptys") != NULL
    drop trigger
        ins_credit_profile_cptys
go

create trigger
    ins_credit_profile_cptys
on
    credit_profile_counterparties
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".credit_profile_counterparties: insert "
        + convert(varchar(10), a.credit_profile_id) + " "
        + convert(varchar(10), a.counterparty_id)
    )
from
    inserted a

go
