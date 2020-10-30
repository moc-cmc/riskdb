drop table remote_recon_statuses
go

create table	
	remote_recon_statuses(
		status_id int,
		match_candidate char(1)
)
go

create unique nonclustered index
	u_rrs
on
	remote_recon_statuses(status_id)
go


exec api_addstatus "New"
exec api_addstatus "Unmatched"
exec api_addstatus "Mismatched"
exec api_addstatus "Matched"
exec api_addstatus "Error"
exec api_addstatus "Processing"
exec api_addstatus "Committed"
exec api_addstatus "Cancelled"
insert into remote_recon_statuses select status_id, "Y" from statuses where name = "New"
insert into remote_recon_statuses select status_id, "Y" from statuses where name = "Unmatched"
insert into remote_recon_statuses select status_id, "Y" from statuses where name = "Mismatched"
insert into remote_recon_statuses select status_id, "N" from statuses where name = "Matched"
insert into remote_recon_statuses select status_id, "N" from statuses where name = "Error"
insert into remote_recon_statuses select status_id, "N" from statuses where name = "Processing"
insert into remote_recon_statuses select status_id, "N" from statuses where name = "Committed"
insert into remote_recon_statuses select status_id, "N" from statuses where name = "Cancelled"
go

if not exists(select name from tables where name = "remote_recon_statuses")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "remote_recon_statuses",
        "E"
    )
end
go

