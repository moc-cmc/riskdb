
if object_id("batches") != NULL
    drop table
        batches
go

create table
    batches (
        batch_id int
    )
go
