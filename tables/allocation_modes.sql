drop table allocation_modes
go

create table
	allocation_modes
(
	allocation_mode_id int,
	name varchar(50),
	description text null
)

go

insert into allocation_modes values(
	1, 
	"Manual Allocation",
	"Capture block level trades and hold them at the block level until they are manually sent to an allocation template by the client or an administrator"
)
insert into allocation_modes values(
	2,
	"Auto-Template Select", 
	"Capture block level trades and automatically select an allocation template for them to be held in until they are manually committed by the client or an administrator"
)
insert into allocation_modes values(
	3,
	"Auto-Commit Deal",
	"Capture block level trades and automatically select and commit them to an allocation template"
)
go

delete from keys where relation = "allocation_modes"
go

insert into keys values("allocation_modes", 3)
go
	

create unique nonclustered index 
	u_am
on
	allocation_modes(allocation_mode_id)
go

create unique nonclustered index 
        n_am
on
        allocation_modes(name)
go



