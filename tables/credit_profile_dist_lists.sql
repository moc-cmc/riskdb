
create table
	credit_profile_dist_lists(
		credit_profile_id int,
		dist_list_id int
	)
go

create unique nonclustered index
	man_cpdl
on
	credit_profile_dist_lists(credit_profile_id, dist_list_id)
go


if not exists(select name from tables where name = "credit_profile_dist_lists")
begin
	insert into
		tables(
			name,
			table_type)
	values(
		"credit_profile_dist_lists",
		"L"
	)
end
go
		
