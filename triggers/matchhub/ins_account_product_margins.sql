
if object_id("ins_account_product_margins") != NULL
    drop trigger
        ins_account_product_margins
go

create trigger
    ins_account_product_margins
on
    account_product_margins
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_product_margins: insert "
        + convert(varchar(10), a.product_id) + " "
        + convert(varchar(50), a.margin) + " "
        + convert(varchar(10), a.external_account_id)
    )
from
    inserted a

go
