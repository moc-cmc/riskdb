if object_id("upd_run_perspective_contracts") != NULL
    drop trigger
        upd_run_perspective_contracts
go

create trigger
    upd_run_perspective_contracts
on
    run_perspective_contracts
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".run_perspective_contracts: update "
        + convert(varchar(10), run_id) + " "
        + convert(varchar(10), contract_id) + " "
        + convert(varchar(10), perspective_contract_id) + " "
        + (case when product_id = NULL then "NULL" else convert(varchar(10), product_id) end)
    )
from
    inserted

go