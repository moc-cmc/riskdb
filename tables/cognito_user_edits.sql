create table
	cognito_user_edits(
		id int identity,
		cognito_user_id int,
		tico_account_id int,
		cognito_user_pool_id int,
		cognito_user_status_id int,
		status_id int,
		phone_number varchar(30) NULL,
		phone_number_verified char(1) NULL,
		create_date datetime NULL,
		last_modify_date datetime NULL,
		cognito_sub varchar(100) NULL,
		mfa_type_id int NULL,
		edited_by int,
		timestamp datetime
)
go

create unique nonclustered index 
	pk
on
	cognito_user_edits(id)
go

create nonclustered index 
        u_snc
on
        cognito_user_edits(cognito_user_id)
go

create nonclustered index 
        u_sn
on
        cognito_user_edits(tico_account_id, cognito_user_pool_id)
go

if not exists(select name from tables where name = "cognito_user_edits")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "cognito_user_edits",
                "J"
        )
end
go

