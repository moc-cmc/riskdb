
if object_id("upd_syssettlements") != NULL
    drop trigger
        upd_syssettlements
go

create trigger
    upd_syssettlements
on
    syssettlements
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".syssettlements: update "
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
    inserted a

go
