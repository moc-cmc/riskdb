
create table
	cognito_settings(
		cognito_setting_id int,
		default_user_pool_id int
)
go

create unique nonclustered index 
	pk
on
	cognito_settings(cognito_setting_id)
go


if not exists(select last_id from keys where relation = "cognito_settings")
begin
	insert into
		keys(
			relation,
			last_id
	)
	values(
		"cognito_settings",
		1
	)
end
go


if not exists(select name from tables where name = "cognito_settings")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "cognito_settings",
                "L"
        )
end
go

