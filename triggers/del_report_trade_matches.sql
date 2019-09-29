if object_id("del_report_trade_matches") != NULL
    drop trigger
        del_report_trade_matches
go

create trigger
    del_report_trade_matches
on
    report_trade_matches
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".report_trade_matches: delete "
        + convert(varchar(50), report_trade_match_id) + " "
        + convert(varchar(10), report_commit_id) + " "
        + convert(varchar(10), trade_id) + " "
        + convert(varchar(10), report_trade_id) + " "
        + convert(varchar(1), inverted) + " "
        + convert(varchar(50), match_strength) + " "
        + convert(varchar(1), symbols_match) + " "
        + convert(varchar(10), status_id) + " "
        + "'" + convert(varchar(26), dateadd(mi, datediff(mi, getdate(), getutcdate()), status_date), 9) + "' "
        + (case when quantity = NULL then "NULL" else convert(varchar(50), quantity) end) + " "
        + (case when price = NULL then "NULL" else convert(varchar(50), price) end)
    )
from
    deleted

go