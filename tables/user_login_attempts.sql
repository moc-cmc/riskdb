
if object_id("user_login_attempts") != NULL
    drop table
        user_login_attempts
go

create table
    user_login_attempts (
        user_login_attempt_id int,
	tico_account_id int NULL,	
	login_provided varchar(25) NULL,
        password_provided varchar(100),
        login_attempt_status_id int,
	timestamp datetime,
	ip varchar(20) NULL
    )
go

create unique nonclustered index 
	u_pk
on
	user_login_attempts(user_login_attempt_id)
go

create nonclustered index 
	n_ti
on
	user_login_attempts(tico_account_id)
go

create nonclustered index
	n_t
on
	user_login_attempts(timestamp)
go

if not exists( select 1 from keys where relation = "user_login_attempts")
begin
	insert into keys values("user_login_attempts", 0)
end
go


