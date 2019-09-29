create table
    messages (
        message_id int,
        author_user_id int,
        message_date datetime,
        channel_id int,
        message_type_id int,
        subject varchar(250),
        content varchar(250) null,
        priority_id int,
        activity_status_id int
    )
go

create unique clustered index
    u_m
on
    messages (
        message_id
    )
go

declare @should_insert varchar(1)
select
	@should_insert = "N"
from
	keys
where
	relation = "messages"

if @should_insert = NULL
begin
	delete from keys where relation = "messages"
	insert into keys(relation, last_id) values("messages", 0)

end

go

