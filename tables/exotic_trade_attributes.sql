
create table
	exotic_trade_attributes(
		trade_id int,
		attribute_type_id int,
		value varchar(200))
go

create unique index
	u_eta
on
	exotic_trade_attributes(
		trade_id,
		attribute_type_id)
go

		
