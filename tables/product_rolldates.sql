
create table 
	product_rolldates (
	product_rolldate_id int identity,
	product_id	int,
	trade_date	datetime,
	closing_date	datetime,
	roll_date	datetime,
	confirmed_at	datetime NULL,
	confirmed_by	varchar(50) NULL)

go


create unique index prdi on product_rolldates (product_rolldate_id)
go

create unique index prd on product_rolldates (product_id, trade_date)
go

if not exists(select name from tables where name = "product_rolldates")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "product_rolldates",
        "J"
    )
end 
go
	
