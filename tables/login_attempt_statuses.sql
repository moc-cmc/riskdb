drop table login_attempt_statuses
go

create table
	login_attempt_statuses(
		login_attempt_status_id int,
		name varchar(30) 
)
go

insert into login_attempt_statuses values(1, "Success")
insert into login_attempt_statuses values(2, "Failed - Invalid Username")
insert into login_attempt_statuses values(3, "Failed - Invalid Password")
go

create unique nonclustered index 
	u_i
on
	login_attempt_statuses(login_attempt_status_id)
go

create unique nonclustered index
	u_in
on
	login_attempt_statuses(name)
go

delete from 
	keys
where
	relation = "login_attempt_statuses"

insert into
	keys
values(
	"login_attempt_statuses",
	3
)
go

