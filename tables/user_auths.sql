
if object_id("user_auths") != NULL
    drop table
        user_auths
go

create table
    user_auths (
        user_auth_id int identity,
        user_id int,
        auth_type_id int,
        name varchar(50),
        pass varchar(100),
        status_id int
    )
with
    identity_gap = 5
go

create unique clustered index
  atn_ua
on
  user_auths (
    auth_type_id,
    name
  )
go

create unique index
  uat_ua
on
  user_auths (
    user_id,
    auth_type_id,
    name
  )
go
