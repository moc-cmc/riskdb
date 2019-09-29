
if object_id("priorities") != NULL
    drop table
        priorities
go

create table
    priorities (
        priority_id int identity,
        name varchar(10),
        number int
    )
go

insert into priorities values("Low", 1)
insert into priorities values("Normal", 2)
insert into priorities values("Medium", 3)
insert into priorities values("High", 4)
insert into priorities values("Critical", 5)
go