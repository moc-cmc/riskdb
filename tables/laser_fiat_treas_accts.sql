
create table
    laser_fiat_treas_accts (
	id int identity,
        product_id  int,
	client_account_id int,
        external_account_id int
    )
go

create unique nonclustered index
    u_as
on
    laser_fiat_treas_accts (
	product_id,
	client_account_id,
        external_account_id
    )
go


if not exists(select * from tables where name = 'laser_fiat_treas_accts')
    insert into tables(name, table_type) values('laser_fiat_treas_accts', 'L')
go
