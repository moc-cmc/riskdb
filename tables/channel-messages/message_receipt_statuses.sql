
if object_id("message_receipt_statuses") != NULL
    drop table
        message_receipt_statuses
go

create table
    message_receipt_statuses (
        message_receipt_status_id int,
        name varchar(25)
    )
go

create unique index
    u_mrs
on
    message_receipt_statuses (
        message_receipt_status_id
    )
go

create unique index
    n_mrs
on
    message_receipt_statuses (
        name
    )
go

insert into message_receipt_statuses values(1, "New")
insert into message_receipt_statuses values(2, "Resend")
insert into message_receipt_statuses values(3, "Failed")
insert into message_receipt_statuses values(4, "Sent")
insert into message_receipt_statuses values(5, "Read")
insert into message_receipt_statuses values(6, "Marked")
insert into message_receipt_statuses values(7, "Deleted")

delete from keys where relation = "message_receipt_statuses"
insert into keys(relation, last_id) values("message_receipt_statuses", 7)

go
