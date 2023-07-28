
if object_id("ins_future_contracts") != NULL
    drop trigger
        ins_future_contracts
go

create trigger
    ins_future_contracts
on
    future_contracts
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".future_contracts: insert "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(10), a.future_id) + " "
        + "'" + convert(varchar(19), a.expiration, 23) + "." + substring(convert(varchar(15), a.expiration, 20), 10, 3) + "'"
    )
from
    inserted a

go
