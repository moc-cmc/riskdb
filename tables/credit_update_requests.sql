create table
	credit_update_requests(
		credit_update_request_id int,
		credit_update_type_id int,
		status_id int,
		tico_account_id int,
		timestamp datetime,
		source_id int,
		identifier varchar(100),
		credit_profile_id int NULL,
		message varchar(100) NULL
)

create unique nonclustered index 
	pk
on
	credit_update_requests(credit_update_request_id)
go

create unique nonclustered index
        nk
on
        credit_update_requests(source_id, identifier)
go


create nonclustered index
	cpti
on
	credit_update_requests(credit_profile_id, timestamp)
go


if not exists(select name from tables where name = "credit_update_requests")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"credit_update_requests",
		"J"
	)
	
	insert into 
		keys 
	values(
		"credit_update_requests", 
		0
	)
end
go
