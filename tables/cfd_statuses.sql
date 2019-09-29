if object_id("cfd_statuses") != NULL
    drop table
        cfd_statuses
go

create table
	cfd_statuses(
		cfd_status_id int,
		contract_id int,
		tico_account_id int,
		status_id int,
		timestamp datetime)

go


create unique nonclustered index u_cs on cfd_statuses(cfd_status_id)
go

if not exists( select 1 from keys where relation = "cfd_statuses")
begin
        insert into keys values("cfd_statuses", 0)
end
go


		
