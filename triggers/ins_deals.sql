
if object_id("ins_deals") != NULL
    drop trigger
        ins_deals
go

create trigger
    ins_deals
on
    deals
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deals: insert "
        + convert(varchar(10), deal_id) + " "
        + convert(varchar(10), deal_type_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), timestamp), 9) + "' "
        + convert(varchar(10), status_id)
    )
from
    inserted

go
