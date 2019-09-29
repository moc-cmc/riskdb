
if object_id("del_pl_attribution_models") != NULL
    drop trigger
        del_pl_attribution_models
go

create trigger
    del_pl_attribution_models
on
    pl_attribution_models
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".pl_attribution_models: delete "
        + convert(varchar(10), a.pl_attribution_model_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.description = NULL then "NULL" else "'" + str_replace(a.description, "'", "\'") + "'" end)
    )
from
    deleted a

go
