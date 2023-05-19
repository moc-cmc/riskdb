create table
        trade_mtms(
                identifier varchar(100),
                source_id int,
                trade_date datetime,
                trade_id int NULL,
                mtm float)

go

create unique nonclustered index
        u_tm
on
        trade_mtms(
                identifier,
                trade_date)
go


create nonclustered index
        n_tm
on
        trade_mtms(
                trade_id,
                trade_date)
go

insert into tables values("trade_mtms", "J")
go
