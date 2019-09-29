create table
	oa_recon_requests(
		oa_recon_request_id int,
		requestor_id int,
		status_id int,
		outside_account_id int,
		request_date datetime,
		respond_timestamp datetime NULL,
		respond_message varchar(150) NULL)

go

create unique index
	pk
on
	oa_recon_requests(oa_recon_request_id)


if not exists(select name from tables where name = "oa_recon_requests")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"oa_recon_requests",
		"J"
	)
	
	insert into 
		keys 
	values(
		"oa_recon_requests", 
		0
	)
end
go


