
if object_id("ins_pl_attribution_models") != NULL
    drop trigger
        ins_pl_attribution_models
go

create trigger
    ins_pl_attribution_models
on
    pl_attribution_models
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".pl_attribution_models: insert "
        + convert(varchar(10), a.pl_attribution_model_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "' "
        + (case when a.description = NULL then "NULL" else "'" + str_replace(a.description, "'", "\'") + "'" end)
    )
from
    inserted a

go
