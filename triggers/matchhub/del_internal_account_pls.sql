
if object_id("del_internal_account_pls") != NULL
    drop trigger
        del_internal_account_pls
go

create trigger
    del_internal_account_pls
on
    internal_account_pls
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".internal_account_pls: delete "
        + convert(varchar(10), a.internal_account_pl_id) + " "
        + convert(varchar(10), a.internal_account_id) + " "
        + "'" + convert(varchar(19), a.pl_date, 23) + "." + substring(convert(varchar(15), a.pl_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.pl_attribution_model_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.pl) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    deleted a

go
