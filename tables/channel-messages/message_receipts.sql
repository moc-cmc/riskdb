
if object_id("message_receipts") != NULL
    drop table
        message_receipts
go

create table
    message_receipts (
        message_receipt_id int,
        message_id int,
        user_address_id int,
        message_receipt_status_id int,
        status_date datetime,
        identifier varchar(75) null,
        error varchar(100) null
    )
go

create unique index
    u_mr
on
    message_receipts (
        message_receipt_id
    )
go

create unique index
    mua_mr
on
    message_receipts (
        message_id,
        user_address_id
    )
go

delete from keys where relation = "message_receipts"
insert into keys(relation, last_id) values("message_receipts", 0)
go

