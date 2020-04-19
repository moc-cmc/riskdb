create table
	mfa_types(
		mfa_type_id int,
		name varchar(15)
)

create unique nonclustered index 
	pk
on
	mfa_types(mfa_type_id)
go

create unique nonclustered index
        nk
on
        mfa_types(name)
go



if not exists(select name from tables where name = "mfa_types")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"mfa_types",
		"E"
	)
	
end
go

if not exists(select name from mfa_types where name in("SMS", "TOTP"))
begin
	insert into 
		keys 
	values(
		"mfa_types", 
		3
	)
	insert into mfa_types values(1, "SMS")
	insert into mfa_types values(2, "TOTP")
end
go
