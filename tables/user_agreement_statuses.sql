/*
 * The request_statuses enums are used for tracking the status of manual or  
 * API-automated external requests. 
 * 
 *   Initial                               Final States (resends discouraged)
 *   -------                               ------------
 *   Pending --> Requested --> Sent --+--> OK
 *                   |          |     '--> Rejected
 *                   '----------'--------> Cancelled
 */
create table 
    request_statuses (
        request_status_id int,
        name varchar(50) 
    )
go

create clustered index 
    u_rs
on  
    request_statuses (
        request_status_id
    )
go

create unique index 
    n_rs
on  
    request_statuses (
        name
    )
go

insert into request_statuses values(1, "Pending")   -- Initial state
insert into request_statuses values(2, "Requested") -- Requested to be sent, 
                                                    -- record request_date
insert into request_statuses values(3, "Sent")      -- Sent to remote, awaiting 
                                                    -- OK/Rejected/Cancelled */
insert into request_statuses values(4, "OK")        -- ACK + Succeeded
insert into request_statuses values(5, "Rejected")  -- NAK'd
insert into request_statuses values(6, "Cancelled") -- Cancelled before 
                                                    -- comnpletion

go


if not exists(select relation from keys where relation = "request_statuses")
begin
	insert into
		keys
	values(
		"request_statuses",
		6
	)
end
go

if not exists(select name from tables where name = "request_statuses")
begin
	insert into
		tables(
			name,
			table_type
	)
	values(
		"request_statuses",
		"E"
	)
end
go
