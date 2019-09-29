create table
	cognito_user_pools(
		cognito_user_pool_id int,
		name varchar(50)
)
go

create unique nonclustered index 
	pk
on
	cognito_user_pools(cognito_user_pool_id)
go

create unique nonclustered index 
        u_sn
on
        cognito_user_pools(name)
go

if not exists(select last_id from keys where relation = "cognito_user_pools")
begin
	insert into
		keys(
			relation,
			last_id
	)
	values(
		"cognito_user_pools",
		1
	)
end
go



if not exists(select name from tables where name = "cognito_user_pools")
begin
        insert into
                tables(
                        name,
                        table_type
        )
        values(
                "cognito_user_pools",
                "L"
        )
end
go

