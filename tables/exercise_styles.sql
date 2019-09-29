
if object_id("exercise_styles") != NULL
    drop table
        exercise_styles
go

create table
    exercise_styles (
        exercise_style_id int,
        name char(100)
    )
go
