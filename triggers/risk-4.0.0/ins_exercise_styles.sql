
if object_id("ins_exercise_styles") != NULL
    drop trigger
        ins_exercise_styles
go

create trigger
    ins_exercise_styles
on
    exercise_styles
for
    insert
as

declare @result int

select
    @result = syb_sendmsg("localhost", 9999,
        "Notify /topic/Store.Notify." + @@servername + "." + db_name() + ".exercise_styles: insert "
        + convert(varchar(10), a.exercise_style_id) + " "
        + "'" + rtrim(str_replace(a.name, "'", "\'")) + "'"
    )
from
    inserted a

go
