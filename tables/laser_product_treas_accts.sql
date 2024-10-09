
create table
    laser_product_treas_accts (
	id int identity,
        product_id  int,
        external_account_id int
    )
go

create unique nonclustered index
    u_as
on
    laser_product_treas_accts (
	product_id,
        external_account_id
    )
go


if not exists(select * from tables where name = 'laser_product_treas_accts')
    insert into tables(name, table_type) values('laser_product_treas_accts', 'L')
go
