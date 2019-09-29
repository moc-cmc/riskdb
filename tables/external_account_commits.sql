
if object_id("external_account_commits") != NULL
    drop table
        external_account_commits
go

create table
    external_account_commits (
        external_account_id int,
        commit_date datetime
    )
go
