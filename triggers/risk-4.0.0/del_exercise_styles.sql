
if object_id("del_exercise_styles") != NULL
    drop trigger
        del_exercise_styles
go

create trigger
    del_exercise_styles
on
    exercise_styles
for
    delete
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".exercise_styles: delete "
        + convert(varchar(10), a.exercise_style_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    deleted a

go
