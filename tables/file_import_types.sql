drop table file_import_types
go

create table
	file_import_types
(
	file_import_type_id int,	
	name varchar(50)
)
go

insert into file_import_types values(1, "Roll")
insert into file_import_types values(2, "Trade Recon")
insert into file_import_types values(3, "Settles")
insert into file_import_types values(4, "Conversion Rates")
go

insert into keys values("file_import_types", 4)
go

create unique nonclustered index
	u_fi
on
	file_import_types(file_import_type_id)
go

create unique nonclustered index
        u_tt
on
        file_import_types(name)
go



