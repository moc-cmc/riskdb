
if object_id("del_aggregation_events") != NULL
    drop trigger
        del_aggregation_events
go

create trigger
    del_aggregation_events
on
    aggregation_events
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".aggregation_events: delete "
        + convert(varchar(10), a.aggregation_event_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.run_id) + " "
        + convert(varchar(10), a.aggregation_model_id) + " "
        + (case when a.agg_begin = NULL then "NULL" else "'" + convert(varchar(19), a.agg_begin, 23) + "." + substring(convert(varchar(15), a.agg_begin, 20), 10, 3) + "'" end) + " "
        + (case when a.agg_end = NULL then "NULL" else "'" + convert(varchar(19), a.agg_end, 23) + "." + substring(convert(varchar(15), a.agg_end, 20), 10, 3) + "'" end) + " "
        + (case when a.pre_num_trades = NULL then "NULL" else convert(varchar(10), a.pre_num_trades) end) + " "
        + (case when a.post_num_trades = NULL then "NULL" else convert(varchar(10), a.post_num_trades) end) + " "
        + (case when a.trade_date = NULL then "NULL" else "'" + convert(varchar(19), a.trade_date, 23) + "." + substring(convert(varchar(15), a.trade_date, 20), 10, 3) + "'" end) + " "
        + (case when a.status_id = NULL then "NULL" else convert(varchar(10), a.status_id) end)
    )
from
    deleted a

go
