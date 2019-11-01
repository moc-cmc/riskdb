
create table
	product_rolldate_edits (
		product_rolldate_edit_id int identity,
		product_rolldate_id 	int,
		product_id		int,
		trade_date		datetime,
		closing_date		datetime,
		roll_date		datetime,
		confirmed_at		datetime NULL,
		confirmed_by		varchar(50) NULL,
		edited_by		varchar(50),
		timestamp		datetime)
go

create index td on product_rolldate_edits (trade_date)
go

if not exists(select name from tables where name = "product_rolldate_edits")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "product_rolldate_edits",
        "J"
    )
end
go






	
