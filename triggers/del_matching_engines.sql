if object_id("del_matching_engines") != NULL
    drop trigger
        del_matching_engines
go

create trigger
    del_matching_engines
on
    matching_engines
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".matching_engines: delete "
        + convert(varchar(10), a.matching_engine_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + convert(varchar(10), a.outbound_source_id) + " "
        + convert(varchar(10), a.initial_match_status_id)
    )
from
    deleted a

go
