
drop table
	spot_value_date_edits
go

create table
        spot_value_date_edits(
                spot_value_date_edit_id int identity,
		contract_id int,
                trade_date datetime,
                closing_date datetime,
                spot_date datetime,
                includes_holiday varchar(1),
		confirmed_at datetime NULL,
		confirmed_by varchar(50) NULL,
		edited_by varchar(50),
		timestamp datetime)


go

create index svtd on spot_value_date_edits (trade_date)
go

if not exists(select name from tables where name = "spot_value_date_edits")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "spot_value_date_edits",
        "J"
    )
end
go

