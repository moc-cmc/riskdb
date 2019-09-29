drop table file_imports
go

create table
	file_imports
(
	file_import_id int,	
	tico_title varchar(50),
	meta_header varchar(50) NULL,
	file_import_type_id int
)
go


insert into keys values("file_imports", 0)
go

create unique nonclustered index
	u_fi
on
	file_imports(file_import_id)
go

create unique nonclustered index
        u_tt
on
        file_imports(tico_title)
go

