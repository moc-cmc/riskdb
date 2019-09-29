if object_id("trade_attributes") != NULL
    drop table
        trade_attributes
go

create table
    trade_attributes (
        trade_id int,
	mid_mark float NULL,
	note varchar(255) NULL,
	exec_price float NULL,
	fixing_center_id int NULL
    )
go

alter table
    trade_attributes
lock datarows
go

create unique index
    u_ta
on
    trade_attributes (
        trade_id 
    )

go

