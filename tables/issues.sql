
if object_id("issues") != NULL
    drop table
        issues
go

create table
    issues (
        issue_id int identity,
        author_user_id int,
        date datetime,
        channel_id int,
        item_relation_id int NULL,
        item_id int NULL,
        subject varchar(250),
        content varchar(250) null,
        properties varchar(250) null,
        priority_id int,
        status_id int,
        check_sql varchar(250) null
    )
go
