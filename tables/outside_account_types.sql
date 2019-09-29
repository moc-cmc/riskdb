create table 
	outside_account_types(
		outside_account_type_id int,
		name varchar(50)
	)
go

create unique nonclustered index
	un_st
on
	outside_account_types(outside_account_type_id)
go

create unique nonclustered index 
	un_n
on
	outside_account_types(name)
go


if not exists(select name from tables where name = "outside_account_types")
begin
        insert into
                tables(
                        name,
                        table_type)
        values(
                "outside_account_types",
                "E"
        )
	/* ENUM DATA */
	insert into outside_account_types values(1, "Fiat")
	insert into outside_account_types values(2, "Digital")
	insert into outside_account_types values(3, "Collateral")
end
go

if not exists(select relation from keys where relation = "outside_account_types")
begin
        insert into
                keys
        values(
                "outside_account_types",
                3
        )
end
go


