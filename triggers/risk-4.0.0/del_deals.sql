
if object_id("del_deals") != NULL
    drop trigger
        del_deals
go

create trigger
    del_deals
on
    deals
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deals: delete "
        + convert(varchar(10), a.deal_id) + " "
        + convert(varchar(10), a.deal_type_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.timestamp), 9) + "' "
        + convert(varchar(10), a.status_id)
    )
from
    deleted a

go
