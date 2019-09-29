
if object_id("option_expirations") != NULL
	drop table
		option_expirations
go

create table
    option_expirations (
        option_expiration_id int,
        option_id int,
        symbol varchar(50),
        expiration datetime,
	timezone_id	int
    )
go

create unique nonclustered index
	u_e 
on
	option_expirations(option_expiration_id)
go

create nonclustered index
	u_i
on
	option_expirations(option_id)
go

create nonclustered index
        u_ie
on
        option_expirations(expiration)
go


