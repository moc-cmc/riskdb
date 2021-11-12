
if object_id("static_actions") != NULL
    drop table
        static_actions
go

create table
	static_actions (
	 static_action_id  int, 
	 name varchar(25)
        )

create unique index sa on static_actions (static_action_id)
go
create unique index sn on static_actions (name)
go

insert into static_actions values (1, "Add")
insert into static_actions values (2, "Edit")
insert into static_actions values (3, "Delete")
insert into static_actions values (4, "Archive")
go


