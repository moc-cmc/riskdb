
if object_id("upd_options") != NULL
    drop trigger
        upd_options
go

create trigger
    upd_options
on
    options
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".options: update "
        + convert(varchar(10), a.option_id) + " "
        + convert(varchar(10), a.underlying_contract_id) + " "
        + convert(varchar(10), a.exchange_id) + " "
        + convert(varchar(10), a.def_exercise_style_id) + " "
        + convert(varchar(50), a.quantity) + " "
        + convert(varchar(50), a.tick_size)
    )
from
    inserted a

go
