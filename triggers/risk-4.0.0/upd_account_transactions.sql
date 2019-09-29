
if object_id("upd_account_transactions") != NULL
    drop trigger
        upd_account_transactions
go

create trigger
    upd_account_transactions
on
    account_transactions
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".account_transactions: update "
        + convert(varchar(10), a.account_transaction_id) + " "
        + convert(varchar(10), a.entered_by) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.transaction_type_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), a.transaction_date), 9) + "' "
        + convert(varchar(10), a.currency_id) + " "
        + convert(varchar(50), a.amount) + " "
        + (case when a.note = NULL then "NULL" else "'" + rtrim(str_replace(a.note, "'", "\'")) + "'" end)
    )
from
    inserted a

go
