create table 
	agg_error_types(
		agg_error_type_id int,
		name varchar(100)
	)
go

create unique nonclustered index
	un_st
on
	agg_error_types(agg_error_type_id)
go

create unique nonclustered index 
	un_n
on
	agg_error_types(name)
go


if not exists(select name from tables where name = "agg_error_types")
begin
        insert into
                tables(
                        name,
                        table_type)
        values(
                "agg_error_types",
                "E"
        )
	/* ENUM DATA */
	insert into agg_error_types values(1, "Inserted aggregate but did not delete from trades")
	insert into agg_error_types values(2, "Did not insert aggregate and did not delete trade from trades")
end
go

if not exists(select relation from keys where relation = "agg_error_types")
begin
        insert into
                keys
        values(
                "agg_error_types",
                3
        )
end
go


