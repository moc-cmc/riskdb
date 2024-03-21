
if object_id("del_syssettlements") != NULL
    drop trigger
        del_syssettlements
go

create trigger
    del_syssettlements
on
    syssettlements
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".syssettlements: delete "
        + convert(varchar(10), a.account_transaction_id) + " "
        + (case when a.deal_id = NULL then "NULL" else convert(varchar(10), a.deal_id) end) + " "
        + convert(varchar(10), a.entered_by) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(10), a.transaction_type_id) + " "
        + "'" + convert(varchar(19), a.transaction_date, 23) + "." + substring(convert(varchar(15), a.transaction_date, 20), 10, 3) + "' "
        + convert(varchar(10), a.currency_id) + " "
        + convert(varchar(50), a.amount) + " "
        + "'" + convert(varchar(19), a.create_date, 23) + "." + substring(convert(varchar(15), a.create_date, 20), 10, 3) + "' "
        + (case when a.note = NULL then "NULL" else "'" + rtrim(str_replace(a.note, "'", "\'")) + "'" end)
    )
from
    deleted a

go
