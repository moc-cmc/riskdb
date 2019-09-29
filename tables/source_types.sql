create table 
	source_types(
		source_type_id int,
		name varchar(50)
	)
go

create unique nonclustered index
	un_st
on
	source_types(source_type_id)
go

create unique nonclustered index 
	un_n
on
	source_types(name)
go

insert into source_types values(1, "Inbound")
insert into source_types values(2, "Outbound")
insert into source_types values(3, "Prime Broker")
insert into source_types values(4, "Internal")
go

insert into keys values("source_types", 4)
go

