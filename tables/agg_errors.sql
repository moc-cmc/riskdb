create table 
	agg_errors(
		agg_error_id int identity,
		timestamp datetime,
		agg_error_type_id int,
		trade_id int NULL,
		aggregated_trade_id int NULL
)
go

create unique nonclustered index
	pk
on
	agg_errors(agg_error_id)
go

if not exists(select name from tables where name = "agg_errors")
begin
        insert into
                tables(
                        name,
                        table_type)
        values(
                "agg_errors",
                "J"
        )
end
go


