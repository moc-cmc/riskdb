
if object_id("auth_types") != NULL
    drop table
        auth_types
go

create table
    auth_types (
        auth_type_id int identity,
        name varchar(25),
        strength float
    )
with
    identity_gap = 5
go

create unique clustered index
  n_at
on
  auth_types (
    name
  )
go

insert auth_types values('Password', 70.0)
insert auth_types values('API Token', 50.0)
insert auth_types values('Browser Token', 10.0)
insert auth_types values('SSH Public Key', 90.0)
go
