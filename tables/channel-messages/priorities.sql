
if object_id("priorities") != NULL
    drop table
        priorities
go

create table
    priorities (
        priority_id int,
        name varchar(15),
        number int
    )
go

create unique clustered index
    u_p
on
    priorities (
        priority_id
    )
go

create unique index
    n_p
on
    priorities (
        name
    )
go

create unique index
    v_p
on
    priorities (
        number
    )
go

insert into priorities values(1, "Debug", 1)
insert into priorities values(2, "Low", 2)
insert into priorities values(3, "Normal", 3)
insert into priorities values(4, "Medium", 4)
insert into priorities values(5, "High", 5)
insert into priorities values(6, "Urgent", 6)

delete from keys where relation = "priorities"
insert into keys(relation, last_id) values("priorities", 6)

go
