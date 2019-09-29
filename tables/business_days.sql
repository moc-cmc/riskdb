create table 
	business_days(
		day_id int,
		day_name varchar(10),
		is_business_day char(1)
)
go

/* Default is M-F */
insert into business_days values(1, "Sunday", "N")
insert into business_days values(2, "Monday", "Y")
insert into business_days values(3, "Tuesday", "Y")
insert into business_days values(4, "Wednesday", "Y")
insert into business_days values(5, "Thursday", "Y")
insert into business_days values(6, "Friday", "Y")
insert into business_days values(7, "Saturday", "N")
go

create unique nonclustered index
	pk
on
	business_days(day_id)
go

create nonclustered index
	n_i
on
	business_days(day_id, is_business_day)
go



