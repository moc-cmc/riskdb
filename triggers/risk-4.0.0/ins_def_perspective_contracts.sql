
if object_id("ins_def_perspective_contracts") != NULL
    drop trigger
        ins_def_perspective_contracts
go

create trigger
    ins_def_perspective_contracts
on
    def_perspective_contracts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".def_perspective_contracts: insert "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.perspective_contract_id) + " "
        + (case when a.product_id = NULL then "NULL" else convert(varchar(10), a.product_id) end)
    )
from
    inserted a

go
