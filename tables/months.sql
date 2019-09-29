drop table months
go

create table
	months(
		name varchar(30),
		shortname varchar(10),
		ordering int
)
go

insert into months values("January", "Jan", 1)
insert into months values("February", "Feb", 2)
insert into months values("March", "Mar", 3)
insert into months values("April", "Apr", 4)
insert into months values("May", "May", 5)
insert into months values("June", "Jun", 6)
insert into months values("July", "Jul", 7)
insert into months values("August", "Aug", 8)
insert into months values("September", "Sept", 9)
insert into months values("October", "Oct", 10)
insert into months values("November", "Nov", 11)
insert into months values("December", "Dec", 12)
go


