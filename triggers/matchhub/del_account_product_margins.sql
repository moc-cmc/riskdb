
if object_id("del_account_product_margins") != NULL
    drop trigger
        del_account_product_margins
go

create trigger
    del_account_product_margins
on
    account_product_margins
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_product_margins: delete "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.margin) + " "
        + convert(varchar(10), a.external_account_id)
    )
from
    deleted a

go
