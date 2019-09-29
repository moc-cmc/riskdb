if object_id("dist_list_emails") != NULL
    drop table
        dist_list_emails
go

create table dist_list_emails
(
	dist_list_id int,
	email_id int
)
go

create unique nonclustered index
	u_t
on
	dist_list_emails(dist_list_id, email_id)
go


