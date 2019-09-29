
if object_id("upd_exercise_styles") != NULL
    drop trigger
        upd_exercise_styles
go

create trigger
    upd_exercise_styles
on
    exercise_styles
for
    update
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".exercise_styles: update "
        + convert(varchar(10), a.exercise_style_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
