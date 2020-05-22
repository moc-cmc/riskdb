
drop table
        risk_class_output
go
create table
        risk_class_output(
                id int identity,
 	        trade_date datetime,
                style varchar(250) NULL,
                risk_class_id int NULL,
                perspective varchar(20) NULL,
                volume float NULL,
                net float NULL,
                saved_volume float NULL,
                saved_net float NULL)
go
create unique index
	u_rco
on
	risk_class_output(
		trade_date,
		risk_class_id)
go

