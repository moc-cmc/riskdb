
if object_id("ip_addrs") != null
    drop table ip_addrs
go

create table
    ip_addrs (
        ip_addr_id int identity,
        name varchar(45),
        mobile char(1) null,
        proxy char(1) null,
        hosting char(1) null,
        geo_loc_id int null
    )
go

create unique nonclustered index 
    u_ia
on 
    ip_addrs (
        ip_addr_id
    )

create unique nonclustered index 
    n_ia
on
    ip_addrs (
        name 
    )
go

if not exists(select * from tables where name = "ip_addrs")
	insert into tables (name, table_type) values ("ip_addrs", "L")
go
