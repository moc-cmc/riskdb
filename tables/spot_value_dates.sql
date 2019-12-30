
drop table
	spot_value_dates
go

create table
        spot_value_dates(
                contract_id int,
                trade_date datetime,
                closing_date datetime,
                spot_date datetime,
                includes_holiday varchar(1),
		confirmed_at datetime NULL,
		confirmed_by varchar(50) NULL)


go

create unique index spvd on spot_value_dates (contract_id, trade_date)
go


