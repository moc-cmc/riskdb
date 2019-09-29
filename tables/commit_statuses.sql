drop table commit_statuses
go

create table
	commit_statuses(
		commit_status_id int,	
		name varchar(25)
)
go

create unique nonclustered index
	u_dc
on
	commit_statuses(commit_status_id)
go

create unique nonclustered index 
        u_dcd
on
        commit_statuses(name)
go

delete from 
	keys
where
	relation="commit_statuses"

insert into commit_statuses values(1, "Commit Requested")
insert into commit_statuses values(2, "Commit Pending")
insert into commit_statuses values(3, "Commit Complete")
insert into commit_statuses values(4, "Uncommit Requested")
insert into commit_statuses values(5, "Uncommit Pending")
insert into commit_statuses values(6, "Uncommit Complete")
insert into commit_statuses values(7, "Commit Failed")
insert into commit_statuses values(8, "Uncommit Failed")

insert into 
	keys
values(
	"commit_statuses",
        9	
	)
go



			
