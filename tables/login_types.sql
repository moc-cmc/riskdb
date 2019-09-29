drop table login_types
go

create table
	login_types(
		login_type_id int,
		name varchar(20),
		suffix varchar(25) NULL,
		limit int NULL
)
go

create unique nonclustered index 
	u_lt
on 
	login_types(login_type_id)
go

create unique nonclustered index
	u_ltn
on
	login_types(name)
go


declare @fund_code varchar(50)

select
        @fund_code = fund_code from funds
select
        @fund_code = str_replace(lower(@fund_code), "", NULL)

insert into login_types (login_type_id, name, suffix, limit) values(1, "Standard", "."+@fund_code, 10) /* this is a stanard login for a client of ours */
insert into login_types (login_type_id, name, suffix, limit) values(2, "Client", "@"+@fund_code, 10) /* this is a login for a client of our client */
insert into login_types (login_type_id, name, suffix) values(3, "Elysium", ".etg") /* this is a login for an elysium user */
insert into login_types (login_type_id, name) values (4, "Disabled")
go

delete from keys where relation = "login_types"
go
insert into keys values("login_types", 5)
go

