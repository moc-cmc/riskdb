
if object_id("ins_options") != NULL
    drop trigger
        ins_options
go

create trigger
    ins_options
on
    options
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9997,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".options: insert "
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
