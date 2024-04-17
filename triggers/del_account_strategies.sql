
if object_id("del_account_strategies") != NULL
    drop trigger
        del_account_strategies
go

create trigger
    del_account_strategies
on
    account_strategies
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_strategies: delete "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.strategy_id)
    )
from
    deleted a

go
