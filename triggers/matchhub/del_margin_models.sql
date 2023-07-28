
if object_id("del_margin_models") != NULL
    drop trigger
        del_margin_models
go

create trigger
    del_margin_models
on
    margin_models
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".margin_models: delete "
        + convert(varchar(10), a.margin_model_id) + " "
        + "'" + str_replace(a.name, "'", "\'") + "'"
    )
from
    deleted a

go
