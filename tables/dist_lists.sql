if object_id("dist_lists") != NULL
    drop table
        dist_lists
go

create table dist_lists
(
	dist_list_id int,
	name varchar(30)
)
go

create unique clustered index
	u_t
on
	dist_lists(dist_list_id)

create unique nonclustered index
	d_n
on
	dist_lists(name)

go


