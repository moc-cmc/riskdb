
if object_id("ins_internal_account_pls") != NULL
    drop trigger
        ins_internal_account_pls
go

create trigger
    ins_internal_account_pls
on
    internal_account_pls
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".internal_account_pls: insert "
        + convert(varchar(10), a.internal_account_pl_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.pl_date), 9) + "' "
        + convert(varchar(10), a.pl_attribution_model_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.pl) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    inserted a

go
