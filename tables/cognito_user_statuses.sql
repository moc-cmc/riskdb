create table 
	cognito_user_statuses(
		cognito_user_status_id int,
		name varchar(50)
	)
go

create unique nonclustered index
	un_st
on
	cognito_user_statuses(cognito_user_status_id)
go

create unique nonclustered index 
	un_n
on
	cognito_user_statuses(name)
go


if not exists(select name from tables where name = "cognito_user_statuses")
begin
        insert into
                tables(
                        name,
                        table_type)
        values(
                "cognito_user_statuses",
                "E"
        )
	/* ENUM DATA */
	insert into cognito_user_statuses values(1, "Unconfirmed")
	insert into cognito_user_statuses values(2, "Confirmed")
	insert into cognito_user_statuses values(3, "Archived")
	insert into cognito_user_statuses values(4, "Compromised")
	insert into cognito_user_statuses values(5, "Unknown")
	insert into cognito_user_statuses values(6, "Reset_Required")
	insert into cognito_user_statuses values(7, "Force_Change_Password")
	insert into cognito_user_statuses values(8, "Pending")
end
go

if not exists(select relation from keys where relation = "cognito_user_statuses")
begin
        insert into
                keys
        values(
                "cognito_user_statuses",
                8
        )
end
go


