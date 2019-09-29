drop table timezones
go

create table timezones (
	timezone_id		int,
	timezone		varchar(25),
	symbol			varchar(15),
	expiration_time	varchar(12),
	display_value   varchar(5),
	status			int)
go

create unique index tz on timezones (timezone)
go
create unique index tzi	on timezones (timezone_id)
go

insert into timezones values (1, "New York 10:00", "NYC","10:00:00","1000", 1)
go
insert into timezones values (2, "Tokyo 15:00", "TKY", "15:00:00","1500", 1)
go
insert into timezones values (3, "Beijing 09:15", "Beijing", "09:15:00","0915", 1)
go
insert into timezones values (4, "Budapest 12:00", "Budapest", "12:00:00","1200", 1)
go
insert into timezones values (5, "Buenos Aires 13:00", "Buenos Aires", "13:00:00","1300", 1)
go
insert into timezones values (6, "London 12:00", "London", "12:00:00", "1200", 1)
go
insert into timezones values (7, "London 15:00", "London", "15:00:00", "1500", 1)
go
insert into timezones values (8, "London 13:30", "London", "13:30:00", "1330", 1)
go
insert into timezones values (9, "Manila 12:30", "Manila", "12:30:00", "1230", 1)
go
insert into timezones values (10, "Moscow 13:30", "Moscow", "13:30:00", "1330", 1)
go
insert into timezones values (11, "Mumbai 14:30", "Mumbai", "14:30:00", "1430", 1)
go
insert into timezones values (12, "New York 12:30", "NYC", "12:30:00", "1230", 1)
go
insert into timezones values (13, "Santiago 16:00", "Santiago", "16:00:00", "1600", 1)
go
insert into timezones values (14, "Sao Paolo 18:00", "Sao Paolo", "18:00:00", "1800", 1)
go
insert into timezones values (15, "Seoul 15:30", "Seoul", "15:30:00", "1530", 1)
go
insert into timezones values (16, "Singapore 10:00", "Singapore", "10:00:00", "1000", 1)
go
insert into timezones values (17, "Sydney 16:00", "Sydney", "16:00:00", "1600", 1)
go
insert into timezones values (18, "Taipei 11:00", "Taipei", "11:00:00", "1100", 1)
go
insert into timezones values (19, "Tel Aviv 15:00", "Tel Aviv", "15:00:00", "1500", 1)
go
insert into timezones values (20, "Warsaw 11:00", "Warsaw", "11:00:00", "1100", 1)
go

