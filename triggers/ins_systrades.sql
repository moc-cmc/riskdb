
if object_id("ins_systrades") != NULL
    drop trigger
        ins_systrades
go

create trigger
    ins_systrades
on
    systrades
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".systrades: insert "
        + convert(varchar(10), a.trade_id) + " "
        + convert(varchar(10), a.deal_id) + " "
        + convert(varchar(10), a.user_id) + " "
        + convert(varchar(10), a.trade_type_id) + " "
        + convert(varchar(10), a.external_account_id) + " "
        + convert(varchar(50), a.quantity) + " "
        + convert(varchar(10), a.contract_id) + " "
        + "'" + convert(varchar(19), a.value_date, 23) + "." + substring(convert(varchar(15), a.value_date, 20), 10, 3) + "' "
        + (case when a.fixing_date = NULL then "NULL" else "'" + convert(varchar(19), a.fixing_date, 23) + "." + substring(convert(varchar(15), a.fixing_date, 20), 10, 3) + "'" end) + " "
        + convert(varchar(50), a.price) + " "
        + "'" + convert(varchar(19), a.trade_date, 23) + "." + substring(convert(varchar(15), a.trade_date, 20), 10, 3) + "' "
        + "'" + str_replace(a.identifier, "'", "\'") + "' "
        + (case when a.pct_price = NULL then "NULL" else convert(varchar(50), a.pct_price) end) + " "
        + (case when a.spot_reference = NULL then "NULL" else convert(varchar(50), a.spot_reference) end) + " "
        + (case when a.ref_trade_id = NULL then "NULL" else convert(varchar(10), a.ref_trade_id) end) + " "
        + (case when a.ref_deal_id = NULL then "NULL" else convert(varchar(10), a.ref_deal_id) end)
    )
from
    inserted a

go
