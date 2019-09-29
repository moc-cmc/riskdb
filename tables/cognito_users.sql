create table
	cognito_users(
		cognito_user_id int,
		tico_account_id int,
		cognito_user_pool_id int,
		cognito_user_status_id int,
		status_id int,
		phone_number varchar(30) NULL,
		phone_number_verified char(1) NULL,
		create_date datetime NULL,
		last_modify_date datetime NULL,
		cognito_sub varchar(100) NULL
)
go

create unique nonclustered index 
	pk
on
	cognito_users(cognito_user_id)
go

create unique nonclustered index 
        u_sn
on
        cognito_users(tico_account_id, cognito_user_pool_id)
go


if not exists(select last_id from keys where relation = "cognito_users")
begin
	insert into
		keys(
			relation,
			last_id
	)
	values(
		"cognito_users",
		1
	)
end
go


if not exists(select name from tables where name = "cognito_users")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "cognito_users",
                "L"
        )
end
go



/* statuses
  
   User Review -> Submitted 	-> Accepted
 				-> Rejected
*/
