
if object_id("ins_account_strategies") != NULL
    drop trigger
        ins_account_strategies
go

create trigger
    ins_account_strategies
on
    account_strategies
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_strategies: insert "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.strategy_id)
    )
from
    inserted a

go
