
if object_id("del_options") != NULL
    drop trigger
        del_options
go

create trigger
    del_options
on
    options
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".options: delete "
        + convert(varchar(10), a.option_id) + " "
        + convert(varchar(10), a.underlying_contract_id) + " "
        + convert(varchar(10), a.exchange_id) + " "
        + convert(varchar(10), a.def_exercise_style_id) + " "
        + convert(varchar(50), a.quantity) + " "
        + convert(varchar(50), a.tick_size)
    )
from
    deleted a

go
