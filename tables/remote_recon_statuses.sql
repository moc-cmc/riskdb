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

