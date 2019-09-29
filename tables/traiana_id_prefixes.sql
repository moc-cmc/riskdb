
if object_id("traiana_id_prefixes") != NULL
    drop table
        traiana_id_prefixes
go

create table
    traiana_id_prefixes (
        id int identity,
	source_id int ,
	symbol varchar(15)
    )
go
