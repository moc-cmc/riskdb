drop table image_paths
go


create table 
	image_paths
(
	image_path_id int identity,
	name varchar(50),
	path varchar(100)
)
go

create unique nonclustered index
	u_ip
on
	image_paths(name)
go





