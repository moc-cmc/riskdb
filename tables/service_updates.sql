create table
	service_updates
(
	service_id int,
	name varchar(50),
        host varchar(25) NULL,
	last_update datetime,
	ping_threshold int NULL
)
go

create unique nonclustered index 
	u_i
on
	service_updates(service_id)
go

create unique nonclustered index 
        u_in
on
        service_updates(name)
go


insert into keys values("service_updates", 0)
go
	
