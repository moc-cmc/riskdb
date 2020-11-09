create table
	switch_source_exclusions(
		source_id int
)
go

create unique nonclustered index
	u_si
on
	switch_source_exclusions(source_id)
go

if not exists(select name from tables where name = "switch_source_exclusions")
begin
    insert into
        tables(
            name,
            table_type
    )
    values(
        "switch_source_exclusions",
        "L"
    )
end
go

