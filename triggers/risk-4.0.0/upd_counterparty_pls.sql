
if object_id("upd_counterparty_pls") != NULL
    drop trigger
        upd_counterparty_pls
go

create trigger
    upd_counterparty_pls
on
    counterparty_pls
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".counterparty_pls: update "
        + convert(varchar(10), a.counterparty_pl_id) + " "
        + convert(varchar(10), a.counterparty_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.pl_date), 9) + "' "
        + convert(varchar(10), a.pl_attribution_model_id) + " "
        + convert(varchar(10), a.product_id) + " "
        + (case when a.pl = NULL then "NULL" else convert(varchar(50), a.pl) end) + " "
        + convert(varchar(10), a.trade_count)
    )
from
    inserted a

go
