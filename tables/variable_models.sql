create table variable_models (
	variable_model_id	int,
	name			varchar(100),
	description		varchar(255))
go

create unique index vmi on variable_models (variable_model_id)
go

create unique index vmn on variable_models (name)
go

insert into variable_models values (1, "None", "No variable pricing for workorder")
go

insert into keys values ("variable_models", 1)
go


