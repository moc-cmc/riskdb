
if object_id("del_fo_sub_accounts") != NULL
    drop trigger
        del_fo_sub_accounts
go

create trigger
    del_fo_sub_accounts
on
    fo_sub_accounts
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".fo_sub_accounts: delete "
        + convert(varchar(10), a.fo_sub_account_id) + " "
        + convert(varchar(10), a.bo_master_account_id) + " "
        + convert(varchar(10), a.external_account_id)
    )
from
    deleted a

go
