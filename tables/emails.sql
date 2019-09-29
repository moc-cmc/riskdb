if object_id("emails") != NULL
    drop table
        emails
go

create table emails
(
	email_id int,
	email varchar(100)
)
go


create unique nonclustered index
	u_t
on
	emails(email_id)
go

create unique nonclustered index
	u_e
on
	emails(email)
go

insert into keys values("emails", 1)
go
