drop table daily_commits
go

create table
	daily_commits(
		daily_commit_id int,
		commit_date datetime,
		commit_status_id int  
)
go

create unique nonclustered index
	u_dc
on
	daily_commits(daily_commit_id)
go

create unique nonclustered index 
        u_dcd
on
        daily_commits(commit_date)
go

create nonclustered index 
	n_dc
on
	daily_commits(commit_status_id)
go


if not exists(select relation from keys where relation = "daily_commits")
begin
	insert into 
		keys
	values(
		"daily_commits",
		1
		)
end
go



			
