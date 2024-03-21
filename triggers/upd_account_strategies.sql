
if object_id("upd_account_strategies") != NULL
    drop trigger
        upd_account_strategies
go

create trigger
    upd_account_strategies
on
    account_strategies
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_strategies: update "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.strategy_id)
    )
from
    inserted a

go
