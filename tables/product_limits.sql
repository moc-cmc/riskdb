drop table product_limits
go

create table
	product_limits(
		product_limit_id int,
		product_id int,
		/*product_limit_type_id int NULL, meant to allow single limit or bucket limit so you can create a g10 exposure limit but thats not the ask right now */
		/* name int,  not needed unless we do buckes, otherwise its just product*/
		nop_type_id int,
		nop_limit float,
		notice_level float,
		warning_level float,
		blocked_level float
	)
go

create unique nonclustered index
	u_cg
on
	product_limits(product_limit_id)
go

create unique nonclustered index 
        u_cgn
on
        product_limits(product_id, nop_type_id)
go 

insert into keys values("product_limits", 1)
go
		
