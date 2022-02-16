
if object_id("upd_otc_matches") != NULL
    drop trigger
        upd_otc_matches
go

create trigger
    upd_otc_matches
on
    otc_matches
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".otc_matches: update "
        + convert(varchar(10), a.otc_match_id) + " "
        + convert(varchar(10), a.requestor_id) + " "
        + "'" + convert(varchar(19), a.request_date, 23) + "." + substring(convert(varchar(15), a.request_date, 20), 10, 3) + "' "
        + "'" + convert(varchar(19), a.trade_date, 23) + "." + substring(convert(varchar(15), a.trade_date, 20), 10, 3) + "' "
        + (case when a.buyer_account_id = NULL then "NULL" else convert(varchar(10), a.buyer_account_id) end) + " "
        + convert(varchar(10), a.buyer_trader_id) + " "
        + convert(varchar(10), a.buyer_legal_entity_id) + " "
        + convert(varchar(10), a.buyer_status_id) + " "
        + (case when a.buyer_trade_id = NULL then "NULL" else convert(varchar(10), a.buyer_trade_id) end) + " "
        + (case when a.seller_account_id = NULL then "NULL" else convert(varchar(10), a.seller_account_id) end) + " "
        + convert(varchar(10), a.seller_trader_id) + " "
        + convert(varchar(10), a.seller_legal_entity_id) + " "
        + convert(varchar(10), a.seller_status_id) + " "
        + (case when a.seller_trade_id = NULL then "NULL" else convert(varchar(10), a.seller_trade_id) end) + " "
        + convert(varchar(10), a.contract_id) + " "
        + convert(varchar(50), a.quantity) + " "
        + convert(varchar(50), a.price) + " "
        + "'" + convert(varchar(19), a.value_date, 23) + "." + substring(convert(varchar(15), a.value_date, 20), 10, 3) + "' "
        + (case when a.execution_status_id = NULL then "NULL" else convert(varchar(10), a.execution_status_id) end) + " "
        + (case when a.execution_response_date = NULL then "NULL" else "'" + convert(varchar(19), a.execution_response_date, 23) + "." + substring(convert(varchar(15), a.execution_response_date, 20), 10, 3) + "'" end) + " "
        + (case when a.execution_message = NULL then "NULL" else "'" + str_replace(a.execution_message, "'", "\'") + "'" end) + " "
        + (case when a.execution_id = NULL then "NULL" else "'" + str_replace(a.execution_id, "'", "\'") + "'" end)
    )
from
    inserted a

go
