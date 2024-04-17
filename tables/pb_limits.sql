drop table
        pb_limits
go

create table
        pb_limits(
                pb_limit_id int,
                prime_broker_id int,
                tico_account_id int,
                limit float,
                as_of datetime)
go

create unique index
        u_pl
on
        pb_limits(
                pb_limit_id)
go

create unique index
        n_pl
on
        pb_limits(
                prime_broker_id)
go

delete

from
        keys
where
        relation = "pb_limits"

insert into
        keys
values(
        "pb_limits",
        0)
go
