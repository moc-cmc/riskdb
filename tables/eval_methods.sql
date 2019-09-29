
if object_id("eval_methods") != NULL
    drop table
        eval_methods
go

create table
    eval_methods (
        eval_method_id int,
        name char(200)
    )
go
