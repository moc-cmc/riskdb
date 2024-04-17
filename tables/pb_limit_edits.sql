drop table
        pb_limit_edits
go

create table
        pb_limit_edits(
                pb_limit_id int,
                prime_broker_id int,
                tico_account_id int,
                limit float,
                as_of datetime)
go
