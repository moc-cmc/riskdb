if object_id("del_run_perspective_contracts") != NULL
    drop trigger
        del_run_perspective_contracts
go

create trigger
    del_run_perspective_contracts
on
    run_perspective_contracts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_perspective_contracts: delete "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), contract_id) + " "
        + convert(varchar(10), perspective_contract_id) + " "
        + (case when product_id = NULL then "NULL" else convert(varchar(10), product_id) end)
    )
from
    deleted

go