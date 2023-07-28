
if object_id("ins_margin_models") != NULL
    drop trigger
        ins_margin_models
go

create trigger
    ins_margin_models
on
    margin_models
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".margin_models: insert "
        + convert(varchar(10), a.margin_model_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    inserted a

go
