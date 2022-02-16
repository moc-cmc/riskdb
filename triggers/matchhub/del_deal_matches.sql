
if object_id("del_deal_matches") != NULL
    drop trigger
        del_deal_matches
go

create trigger
    del_deal_matches
on
    deal_matches
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".deal_matches: delete "
        + convert(varchar(10), a.deal_match_id) + " "
        + "'" + convert(varchar(19), a.entry_date, 23) + "." + substring(convert(varchar(15), a.entry_date, 20), 10, 3) + "' "
        + (case when a.long_deal_id = NULL then "NULL" else convert(varchar(10), a.long_deal_id) end) + " "
        + (case when a.long_timestamp = NULL then "NULL" else "'" + convert(varchar(19), a.long_timestamp, 23) + "." + substring(convert(varchar(15), a.long_timestamp, 20), 10, 3) + "'" end) + " "
        + (case when a.short_deal_id = NULL then "NULL" else convert(varchar(10), a.short_deal_id) end) + " "
        + (case when a.short_timestamp = NULL then "NULL" else "'" + convert(varchar(19), a.short_timestamp, 23) + "." + substring(convert(varchar(15), a.short_timestamp, 20), 10, 3) + "'" end) + " "
        + convert(varchar(10), a.match_status_id) + " "
        + (case when a.identifier = NULL then "NULL" else "'" + str_replace(a.identifier, "'", "\'") + "'" end)
    )
from
    deleted a

go
