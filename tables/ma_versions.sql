use
	risk_atglobal
go

drop table
	ma_versions
go

create table
	ma_versions(
		ma_version_id int,
		master_allocation_id int,
		version int,
		allocation_mode_id int,
		status_id int,
		creation_date datetime,
		deployment_date datetime NULL,
		retirement_date datetime NULL)
go

create unique index
	u_mv
on
	ma_versions(
		ma_version_id)
go

create unique index
	n_mv
on
	ma_versions(
		master_allocation_id,
		version)
go
		
delete

from
	keys
where
	relation = "ma_versions"

insert into
	keys
values(
	"ma_versions",
	0)
go


